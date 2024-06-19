//
//  SettingsPageViewController.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import UIKit

final class SettingsPageViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak var settingsTableView: UITableView!
    @IBOutlet weak var versionLabel: UILabel!
    
    // MARK: Properties
    var viewModel: SettingsPageViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewUI()
        registerCells()

    }
    
    init(menuType: SettingsMenuType) {
        self.viewModel?.menuType = menuType
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTableViewUI() {
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
    }

    private func registerCells() {
        settingsTableView.register(.init(nibName: SettingsPageTableViewCell.identifier, bundle: nil), forCellReuseIdentifier:  SettingsPageTableViewCell.identifier)
    }
    
    
    @IBAction func termsAndConditions(_ sender: Any) {
    }
    @IBAction func privacyPolicy(_ sender: Any) {
    }
}

extension SettingsPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier:  SettingsPageTableViewCell.identifier, for: indexPath) as? SettingsPageTableViewCell
        switch viewModel?.menuType {
        case .notPremiumAccount:
            if let settingsMenuItems = viewModel?.menuItems {
                cell?.setUpLoginMyAccount(loginMenuItem: loginMenuItems[indexPath.row])
            }
        case .nonLoginMyAccount:
            if let nonLoginMyAccount = viewModel?.nonLoginMenuItems {
                cell?.setUpNonLoginMyAccount(nonLoginMenuItem: nonLoginMyAccount[indexPath.row])
            }
        case .none:
            break
        }
        return cell ?? UITableViewCell()
    }
    
}
