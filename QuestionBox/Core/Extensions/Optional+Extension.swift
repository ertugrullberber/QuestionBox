//
//  Optional+Extension.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import Foundation

extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        self?.isEmpty ?? true
    }
}
