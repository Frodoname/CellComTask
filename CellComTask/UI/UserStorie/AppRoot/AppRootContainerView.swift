//
//  AppRootContainerView.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import SwiftUI

struct AppRootContainerView: View {
    var body: some View {
        NavigationStack(path: $router.selectionPath) {
            ZStack {
                Image(.launchScreen)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .onAppear(perform: viewModel.goHome)
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .home:
                    viewFactory.makeHomeView()
                case .detail(let movie):
                    viewFactory.makeDetailView(movie)
                }
            }
        }
    }
    
    @EnvironmentObject private var viewModel: AppRootViewModel
    @EnvironmentObject private var router: NavigationManager
}
