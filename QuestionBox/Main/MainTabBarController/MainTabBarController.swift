//
//  MainTabBarController.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func setUp() {
        tabBar.backgroundColor = .clear
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setTabBarControllers(controllers: [getHomeViewController(),
                                           getDiscountViewController(),
                                           getBasketViewController()])
    }

    override func loadView() {
        super.loadView()
        setupCustomTabBar()
    }

    func setupCustomTabBar() {
        let path: UIBezierPath = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.clear.cgColor
        shape.fillColor = UIColor.black.withAlphaComponent(0.5).cgColor
        tabBar.layer.insertSublayer(shape, at: 0)

        // Gölge eklemek için
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3

        tabBar.itemWidth = 40
        tabBar.itemPositioning = .fill

        // Tab bar arka planını daha şeffaf ve siyah yapmak için
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = tabBar.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tabBar.insertSubview(blurEffectView, at: 0)
        tabBar.isTranslucent = true
    }

    func setTabBarControllers(controllers: [UIViewController]) {
        self.setViewControllers(controllers, animated: true)
        for (index, controller) in controllers.enumerated() {
            switch index {
            case 0:
                controller.tabBarItem.image = UIImage(named: IconTypes.gamePage.rawValue)?.withRenderingMode(.alwaysOriginal)
                controller.tabBarItem.selectedImage = UIImage(named: IconTypes.gamePageClicked.rawValue)?.withRenderingMode(.alwaysOriginal)
            case 1:
                controller.tabBarItem.image = UIImage(named: IconTypes.recordedPage.rawValue)?.withRenderingMode(.alwaysOriginal)
                controller.tabBarItem.selectedImage = UIImage(named: IconTypes.recordedPageClicked.rawValue)?.withRenderingMode(.alwaysOriginal)
            case 2:
                controller.tabBarItem.image = UIImage(named: IconTypes.settingsPage.rawValue)?.withRenderingMode(.alwaysOriginal)
                controller.tabBarItem.selectedImage = UIImage(named: IconTypes.settingsPageClicked.rawValue)?.withRenderingMode(.alwaysOriginal)
            default:
                break
            }
        }
    }

    func getPathForTabBar() -> UIBezierPath {
        let frameWidth = self.tabBar.bounds.width
        let frameHeight = self.tabBar.bounds.height * 2
        let cornerRadius: CGFloat = 40

        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: cornerRadius))
        path.addCurve(to: CGPoint(x: cornerRadius, y: 0),
                      controlPoint1: CGPoint(x: 0, y: 0),
                      controlPoint2: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: frameWidth - cornerRadius, y: 0))
        path.addCurve(to: CGPoint(x: frameWidth, y: cornerRadius),
                      controlPoint1: CGPoint(x: frameWidth, y: 0),
                      controlPoint2: CGPoint(x: frameWidth, y: 0))
        path.addLine(to: CGPoint(x: frameWidth, y: frameHeight))
        path.addLine(to: CGPoint(x: 0, y: frameHeight))
        path.close()
        return path
    }
}

extension MainTabBarController {

    private func getHomeViewController() -> UINavigationController {
        let viewController = HomePageViewController()
        viewController.viewModel = HomePageViewModel()
        let navController = NavigationHelper.navigationControllerFactory(viewController)
        return navController
    }

    private func getDiscountViewController() -> UINavigationController {
        let viewController = RecordedPageViewController()
        viewController.viewModel = RecordedPageViewModel()
        let navController = NavigationHelper.navigationControllerFactory(viewController)
        return navController
    }

    private func getBasketViewController() -> UINavigationController {
        let viewController = SettingsPageViewController(menuType: .notPremiumAccount)
        viewController.viewModel = SettingsPageViewModel()
        let navController = NavigationHelper.navigationControllerFactory(viewController)
        return navController
    }
}
