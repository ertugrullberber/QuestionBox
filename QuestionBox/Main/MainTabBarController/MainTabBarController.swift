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
        let path : UIBezierPath = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        self.tabBar.layer.insertSublayer(shape, at: 0)
        self.tabBar.itemWidth = 40
        self.tabBar.itemPositioning = .fill
        self.tabBar.tintColor = UIColor.fountainBlue
    }

    func setTabBarControllers(controllers: [UIViewController]) {
        self.setViewControllers(controllers, animated: true)
        for (index, _) in controllers.enumerated() {
            if index == 0 {
                controllers[0].title = "Anasayfa"
                controllers[0].tabBarItem.image = UIImage(named: IconTypes.homePageIcon.rawValue)
                controllers[0].tabBarItem.selectedImage = UIImage(named: IconTypes.homePageClicked.rawValue)
            } else if index == 1 {
                controllers[1].title = "İndirimler"
                controllers[1].tabBarItem.image = UIImage(named: IconTypes.discountPageIcon.rawValue)
                controllers[1].tabBarItem.selectedImage = UIImage(named: IconTypes.discountPageClicked.rawValue)
            } else if index == 2 {
                controllers[2].title = "Sepetim"
                controllers[2].tabBarItem.image = UIImage(named: IconTypes.shoppingPageIcon.rawValue)
                controllers[2].tabBarItem.selectedImage = UIImage(named: IconTypes.shoppingPageClicked.rawValue)
            } else if index == 3 {
                controllers[3].title = "Kategoriler"
                controllers[3].tabBarItem.image = UIImage(named: IconTypes.categoriesPageIcon.rawValue)
                controllers[3].tabBarItem.selectedImage = UIImage(named: IconTypes.categoriesPageIconClicked.rawValue)
            } else {
                controllers[4].title = "Hesabım"
                controllers[4].tabBarItem.image = UIImage(named: IconTypes.myaccountPageIcon.rawValue)
                controllers[4].tabBarItem.selectedImage = UIImage(named: IconTypes.myaccountPageClicked.rawValue)
            }
        }
    }

    func getPathForTabBar() -> UIBezierPath {

        let frameWidth = self.tabBar.bounds.width
        let frameHeight = self.tabBar.bounds.height*2
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
        let viewController = SettingsPageViewController()
        viewController.viewModel = SettingsPageViewModel()
        let navController = NavigationHelper.navigationControllerFactory(viewController)
        return navController
    }
}
