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
    
    func getArticles() async throws {
        let requestedArticles: [Article]
        if dependencies.networkMonitor.isConnected {
            requestedArticles = try await dependencies.getArticlesUseCase.getArticles()
            try await dependencies.saveArticlesUseCase.saveArticles(requestedArticles)
            throw CodableError.DecodingFailed
        }else {
            requestedArticles = try await dependencies.getLocalArticlesUseCase.getLocalArticles()
        }
        await updateArticles(withArticles: requestedArticles)
    }
    
    func deleteArticle(at offsets: IndexSet) async throws {
        let idsToDelete = offsets.map { articles[$0].id }
        guard let idToDelete = idsToDelete.first else {
            return
        }
        try await dependencies.saveDeletedArticleIdUseCase.addDeletedArticleId(idToDelete)
        articles.remove(atOffsets: offsets)
    }
    
    @MainActor private func updateArticles(withArticles newArticles: [Article]) {
        articles = newArticles
    }
}
