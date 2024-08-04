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
            let viewModel = ArticlesViewModel(getArticlesUseCase: GetArticlesUseCaseFactory().factoryUseCase())
            ArticlesListView(viewModel: viewModel)
        }
    }
}
