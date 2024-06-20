//
//  BaseButton.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import UIKit

class BaseButton: UIButton {

    enum BaseButtonType {
        case primary
        case secondary
    }

    @IBInspectable var isPrimaryButton: Bool = true {
        didSet {
            baseButtonType = isPrimaryButton ? .primary : .secondary
        }
    }

    var baseButtonType: BaseButtonType = .primary {
        didSet {
            updateButtonAppearance()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        updateButtonAppearance()
    }

    private func updateButtonAppearance() {
        layer.cornerRadius = 5
        layer.borderWidth = 1

        let font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]

        let attributedTitle = NSAttributedString(string: titleLabel?.text ?? "", attributes: attributes)
        setAttributedTitle(attributedTitle, for: .normal)

        switch baseButtonType {
        case .primary:
            layer.borderColor = UIColor.fountainBlue.cgColor
            backgroundColor = UIColor.fountainBlue
            setTitleColor(UIColor.white, for: .normal)
        case .secondary:
            layer.borderColor = UIColor.fountainBlue.cgColor
            backgroundColor = UIColor.clear
            setTitleColor(UIColor.fountainBlue, for: .normal)
        }
    }
}
