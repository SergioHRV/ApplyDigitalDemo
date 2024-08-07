//
//  ArticlesListView.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import SwiftUI

struct ArticlesListView: View {
    @Environment(DefaultNetworkMonitor.self) private var newtworkMonitor
    @ObservedObject private var viewModel: ArticlesViewModel
    @State private var isFirsTime = true
    @State private var showingAlert = false
    
    var body: some View {
        
        List {
            ForEach(viewModel.articles, id: \.self) { article in
                if let url = URL(string: article.articleUrl),
                   newtworkMonitor.isConnected {
                    NavigationLink {
                        WebView(url)
                    } label: {
                        ArticleRow(article: article)
                    }
                }else {
                    ArticleRow(article: article)
                }
            }
            .onDelete(perform: delete)
            .listRowInsets(.none)
        }
        .environment(\.defaultMinListRowHeight, 90)
        .listStyle(.plain)
        .refreshable {
            getArticles()
        }
        .onAppear(perform: {
            if isFirsTime {
                isFirsTime = false
                getArticles()
            }
        })
        .alert(TextADD.General.alertTitle,
               isPresented: $showingAlert,
               actions: {
            Button(TextADD.General.alertOk, role: .cancel) {
                showingAlert = false
            }
        },
               message: {
            Text(TextADD.General.alertMessage)
        })
    }
    
    init(viewModel: ArticlesViewModel) {
        self.viewModel = viewModel
    }
    
    private func getArticles() {
        Task{
            do {
                try await viewModel.getArticles()
            } catch {
                showingAlert = true
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        Task {
            do {
                try await viewModel.deleteArticle(at: offsets)
            } catch {
                showingAlert = true
            }
        }
    }
}

fileprivate struct ArticleRow: View {
    
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(article.title)
                .font(.system(size: 16, weight: .semibold))
            
            HStack {
                Text(article.author)
                
                Text(article.createdAt.timeAgo())
            }
            .font(.system(size: 10, weight: .regular))
            .foregroundStyle(.gray)
        }
    }
}

#Preview {
    let viewModel = ArticlesViewModel(dependencies: ArticlesDependenciesDummyFactory().factory())
    
    return ArticlesListView(viewModel: viewModel)
        .environment(DefaultNetworkMonitor())
}
