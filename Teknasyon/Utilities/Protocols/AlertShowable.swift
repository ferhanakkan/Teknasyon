//
//  AlertShowable.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import Foundation

protocol AlertShowable {
    func showAlert(with message: String)
}

extension AlertShowable {

    func showAlert(with message: String) {
        AlertManager.shared.showInfoAlert(message: message)
    }
}
