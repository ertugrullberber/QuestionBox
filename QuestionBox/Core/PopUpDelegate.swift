//
//  PopUpDelegate.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import Foundation

protocol PopUpDelegate {
    func showPopUp(title: String?, actionMessage: String, detailMessage: String?)
    func showPopUpSection(title: String?, detailMessage: String?, yesAction: (() -> Void)?, noAction: (() -> Void)?)
}
