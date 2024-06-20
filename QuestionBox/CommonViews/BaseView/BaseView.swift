//
//  BaseView.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import UIKit

enum State {
    case unknown, loading, success, error

    static func == (left: State, right: State) -> Bool {
        switch (left, right) {
        case (.unknown, .unknown):
            return true
        case (.loading, .loading):
            return true
        case (.success, .success):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }
}

protocol XibLoadable {}

extension XibLoadable where Self: BaseView {

    static func loadFromNib() -> Self {
        let nib = UINib(nibName: String(describing: self), bundle: nil)
        return (nib.instantiate(withOwner: self, options: nil).first as? Self) ?? .init()
    }
}

class BaseView: UIView, XibLoadable {

    func setup(_ model: BaseViewModel) { }

    func configureUIAfterLayout() { }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureUIAfterLayout()
    }
}
