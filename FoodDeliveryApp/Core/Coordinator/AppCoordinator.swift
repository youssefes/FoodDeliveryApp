//
//  AppCoordinator.swift
//  mutwafa
//
//  Created by Mader's Macbook Pro on 10/07/2025.
//

import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to screen: AppScreens) {
        path.append(screen)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func resetTo(_ newRoot: AppScreens) {
        path = NavigationPath() // Clear all
        path.append(newRoot)    // Set new root
    }
}
