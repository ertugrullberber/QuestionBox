//
//  BaseViewController.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import UIKit

protocol BaseSearchBarDelegate: AnyObject {
    func didPressSearchButton(with text: String?)
}

class BaseViewController: UIViewController {

    private var disposal = Disposal()
    private var activityIndicator = UIActivityIndicatorView(style: .large)
    var viewTitle: String { "" }
    weak var searchBarDelegate: BaseSearchBarDelegate?

    var baseSearchBar: UISearchBar = {
        let screenWidth = UIScreen.main.bounds.width
        let searchWidth = screenWidth
        let searchHeight: CGFloat = 50
        let searchBar = UISearchBar(frame: CGRect(x: 8, y: 0, width: searchWidth, height: searchHeight))

        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = UIColor.primary500

        if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
            searchTextField.layer.cornerRadius = 10
            searchTextField.layer.borderWidth = 1
            searchTextField.layer.borderColor = UIColor.primary500.cgColor
            searchTextField.attributedPlaceholder = NSAttributedString(string: "Ara", attributes: [NSAttributedString.Key.foregroundColor: UIColor.primary500])
            searchTextField.backgroundColor = UIColor.white

            if let leftView = searchTextField.leftView as? UIImageView {
                leftView.tintColor = UIColor.primary500
            }
        }
        return searchBar
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        title = viewTitle
    }
    
    func setNavigationBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor.primary600
        self.navigationItem.backBarButtonItem = backButton
    }
}

extension BaseViewController: APIHandlerDelegate {
    func showLoading() {
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.activityIndicator.stopAnimating()
        }
    }
}

extension BaseViewController: PopUpDelegate {
    func showPopUpSection(title: String?, detailMessage: String?, yesAction: (() -> Void)?, noAction: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: detailMessage, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Evet", style: .default) { _ in
            yesAction?()
        }
        alertController.addAction(yesAction)
        let noAction = UIAlertAction(title: "Hayır", style: .default) { _ in
            noAction?()
        }
        alertController.addAction(noAction)
        if let topViewController = UIApplication.shared.windows.first?.rootViewController {
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }

    func showPopUp(title: String?, actionMessage: String, detailMessage: String?) {
        let alertController = UIAlertController(title: title, message: detailMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionMessage, style: .default, handler: nil))
        if let topViewController = UIApplication.shared.windows.first?.rootViewController {
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }

    func showPopUpWithAction(title: String?, actionMessage: String, detailMessage: String?, action: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: detailMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: actionMessage, style: .default) { _ in
            action?()
        }
        alertController.addAction(okAction)
        if let topViewController = UIApplication.shared.windows.first?.rootViewController {
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }
}

extension BaseViewController {
    func searchBarSet(searchBar: UISearchBar?) {
        searchBar?.backgroundImage = UIImage()
        searchBar?.barTintColor = UIColor.primary500
        
        if let searchTextField = searchBar?.value(forKey: "searchField") as? UITextField {
            searchTextField.layer.cornerRadius = 10
            searchTextField.layer.borderWidth = 1
            searchTextField.layer.borderColor = UIColor.primary500.cgColor
            searchTextField.attributedPlaceholder = NSAttributedString(string: "Ara", attributes: [NSAttributedString.Key.foregroundColor: UIColor.primary400])
            searchTextField.backgroundColor = UIColor.white
            if let leftView = searchTextField.leftView as? UIImageView {
                leftView.tintColor = UIColor.primary400
            }
        }
    }
}

extension BaseViewController: UISearchBarDelegate {
    func customNavigationBar(showBackButton: Bool = true) {
        self.navigationController?.navigationBar.isHidden = false

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground
        ]
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance

        baseSearchBar.placeholder = "Ara"
        baseSearchBar.backgroundImage = UIImage()

        let searchBarWidth: CGFloat = UIScreen.main.bounds.width - (showBackButton ? 100 : 20)
        baseSearchBar.frame = CGRect(x: 0, y: 0, width: searchBarWidth, height: 50)
        baseSearchBar.borderColor = UIColor.primary400
        baseSearchBar.delegate = self

        let searchBarButtonItem = UIBarButtonItem(customView: baseSearchBar)

        if showBackButton {
            let backButtonImage = UIImage(named: "backItem")
            let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
            backButton.tintColor = UIColor.primary600
            self.navigationItem.leftBarButtonItems = [backButton, searchBarButtonItem]
        } else {
            self.navigationItem.leftBarButtonItem = searchBarButtonItem
        }
        setKeywordCloseTapGesture()
    }

    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let searchText = searchBar.text
        searchBarDelegate?.didPressSearchButton(with: searchText)
    }

    private func setKeywordCloseTapGesture() {
        let keywordCloseTapGesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyword))
        keywordCloseTapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(keywordCloseTapGesture)
        baseSearchBar.delegate = self
    }

    @objc private func closeKeyword() {
        baseSearchBar.resignFirstResponder()
    }
}
