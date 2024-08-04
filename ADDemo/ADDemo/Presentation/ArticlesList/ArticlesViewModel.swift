//
//  ArticlesViewModel.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import SwiftUI

final class ArticlesViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    private let getArticlesUseCase: GetArticlesUseCase
    
    init(getArticlesUseCase: GetArticlesUseCase) {
        self.getArticlesUseCase = getArticlesUseCase
    }
    
    func getArticles() {
        Task {
            do {
                let articlesResponse = try await getArticlesUseCase.getArticles()
                await MainActor.run {
                    articles = articlesResponse
                }
            } catch {
                print("error")
            }
        }
    }
}
