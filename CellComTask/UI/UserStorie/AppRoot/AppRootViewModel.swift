//
//  AppRootViewModel.swift
//  CellComTask
//
//  Created by Fed on 27.10.2023.
//

import Foundation

final class AppRootViewModel: ObservableObject {
    func goHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.popTo(.home)
        }
    }
}

extension AppRootViewModel: Navigatable { }
