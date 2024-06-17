//
//  BaseTableViewCell.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    static var identifier: String {
        String(describing: self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
    }

    func setup(_ model: BaseViewModel) { }
}

extension BaseTableViewCell: PopUpDelegate {
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
}
