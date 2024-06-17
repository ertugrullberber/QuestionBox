//
//  BaseViewModel.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import Foundation
import Alamofire
import UIKit

class BaseViewModel {
    private(set) var state = Observable(State.unknown)
    weak var apiDelegate: APIHandlerDelegate?

    func setState(_ state: State) {
        self.state.value = state
    }
}
