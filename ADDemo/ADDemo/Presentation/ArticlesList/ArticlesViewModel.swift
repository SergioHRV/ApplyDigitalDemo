//
//  ArticlesViewModel.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import SwiftUI

final class ArticlesViewModel: ObservableObject {
    struct Dependencies {
        let getArticlesUseCase: GetArticlesUseCase
        let getLocalArticlesUseCase: GetLocalArticlesUseCase
        let saveArticlesUseCase: SaveLocalArticlesUseCase
        let saveDeletedArticleIdUseCase: SaveDeletedArticleIdUseCase
        let networkMonitor: NetworkMonitor
    }

    @Published var articles: [Article] = []
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func getArticles() {
        Task {
            do {
                if dependencies.networkMonitor.isConnected {
                    let articlesResponse = try await dependencies.getArticlesUseCase.getArticles()
                    dependencies.saveArticlesUseCase.saveArticles(articlesResponse)
                    await updateArticles(withArticles: articlesResponse)
                }else {
                    let localArticles = dependencies.getLocalArticlesUseCase.getLocalArticles()
                    await updateArticles(withArticles: localArticles)
                }
            } catch {
                let nsError = error as NSError
                print("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func deleteArticle(at offsets: IndexSet) {
        let idsToDelete = offsets.map { articles[$0].id }
        guard let idToDelete = idsToDelete.first else {
            return
        }
        dependencies.saveDeletedArticleIdUseCase.addDeletedArticleId(idToDelete)
        articles.remove(atOffsets: offsets)
    }
    
    @MainActor private func updateArticles(withArticles newArticles: [Article]) {
        articles = newArticles
    }
}
