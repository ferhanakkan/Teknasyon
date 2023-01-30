//
//  LoadingShowable.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

protocol LoadingShowable {
    func showLoading()
    func hideLoading()
}

extension LoadingShowable {

    func showLoading() {
        LoadingManager.shared.showIndicator()
    }

    func hideLoading() {
        LoadingManager.shared.hideIndicator()
    }
}
