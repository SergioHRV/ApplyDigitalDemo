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
    
    func getArticles() async {
        let requestedArticles: [Article]
        do {
            if dependencies.networkMonitor.isConnected {
                requestedArticles = try await dependencies.getArticlesUseCase.getArticles()
                try await dependencies.saveArticlesUseCase.saveArticles(requestedArticles)
            }else {
                requestedArticles = try await dependencies.getLocalArticlesUseCase.getLocalArticles()
            }
            await updateArticles(withArticles: requestedArticles)
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func deleteArticle(at offsets: IndexSet) async {
        let idsToDelete = offsets.map { articles[$0].id }
        guard let idToDelete = idsToDelete.first else {
            return
        }
        do {
            try await dependencies.saveDeletedArticleIdUseCase.addDeletedArticleId(idToDelete)
            articles.remove(atOffsets: offsets)
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    @MainActor private func updateArticles(withArticles newArticles: [Article]) {
        articles = newArticles
    }
}
