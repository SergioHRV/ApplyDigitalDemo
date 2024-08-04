//
//  ArticlesListView.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import SwiftUI

struct ArticlesListView: View {
    
    @ObservedObject private var viewModel: ArticlesViewModel
    
    var body: some View {
        List(viewModel.articles) { item in
            Text(item.title)
                .foregroundStyle(.green)
        }
        .refreshable {
            getArticles()
        }
        .padding()
        .background(Color.white)
    }
    
    init(viewModel: ArticlesViewModel) {
        self.viewModel = viewModel
    }
    
    private func getArticles() {
        viewModel.getArticles()
    }
}

#Preview {
    let viewModel = ArticlesViewModel(dependencies: ArticlesDependenciesDummyFactory().factory())
    
    return ArticlesListView(viewModel: viewModel)
}
