//
//  ADDemoApp.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 3/08/24.
//

import SwiftUI

@main
struct ADDemoApp: App {
    @State private var networkMonitor = DefaultNetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                let viewModel = ArticlesViewModel(dependencies: ArticlesDependenciesFactory().factory())
                ArticlesListView(viewModel: viewModel)
                    .environment(networkMonitor)
            }
        }
    }
}
