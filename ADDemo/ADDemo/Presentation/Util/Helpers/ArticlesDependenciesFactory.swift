//
//  ArticlesDependenciesFactory.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

final class ArticlesDependenciesFactory {
    
    func factory() -> ArticlesViewModel.Dependencies {
        let respository = DefaultArticleRepository()
        let localRepository = DefaultLocalArticleRepository()
        let getArticles = DefaultGetArticlesUseCase(repositry: respository)
        let getLocalArticles = DefaultGetLocalArticlesUseCase(repositry: localRepository)
        let saveArticles = DefaultSaveLocalArticlesUseCase(repositry: localRepository)
        let monitor = DefaultNetworkMonitor()
        let dependencies = ArticlesViewModel.Dependencies(getArticlesUseCase: getArticles,
                                                          getLocalArticlesUseCase: getLocalArticles,
                                                          saveArticlesUseCase: saveArticles,
                                                          networkMonitor: monitor)
        return dependencies
    }
}
