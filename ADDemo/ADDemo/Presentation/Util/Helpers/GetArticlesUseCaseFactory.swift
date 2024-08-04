//
//  GetArticlesUseCaseFactory.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

final class GetArticlesUseCaseFactory {
    
    func factoryUseCase() -> GetArticlesUseCase {
        let respository = DefaultArticleRepository()
        let useCase = DefaultGetArticlesUseCase(repositry: respository)
        return useCase
    }
}
