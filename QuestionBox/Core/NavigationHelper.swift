//
//  NavigationHelper.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import UIKit

final class NavigationHelper {

    static func topViewController() -> UIViewController? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        guard var navC = window?.rootViewController as? UINavigationController else { return nil }
        setNavBarAppereance(&navC)
        return navC.visibleViewController
    }

    static func navigate(viewController: UIViewController) {
        if let navigationController = topViewController()?.navigationController {
            navigationController.pushViewController(viewController, animated: true)
        }
    }

    static func navigationControllerFactory(_ root: UIViewController) -> UINavigationController {
        var navController = UINavigationController(rootViewController: root)
        setNavBarAppereance(&navController)
        return navController
    }

    private static func setNavBarAppereance(_ navController: inout UINavigationController) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = appearance
        let backItem = UIBarButtonItem()
        navController.navigationBar.backgroundColor = .white
        backItem.title = ""
        backItem.tintColor = .primary600
        navController.navigationBar.topItem?.backBarButtonItem = backItem
    }
}
