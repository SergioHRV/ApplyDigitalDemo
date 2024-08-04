//
//  ADDemoApp.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import SwiftUI

@main
struct ADDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let respository = DefaultArticleRepository()
            let useCase = DefaultGetArticlesUseCase(repositry: respository)
            let viewModel = ArticlesViewModel(getArticlesUseCase: useCase)
            ArticlesListView(viewModel: viewModel)
        }
    }
}
