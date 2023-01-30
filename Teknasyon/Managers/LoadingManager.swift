//
//  LoadingManager.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import UIKit

final class LoadingManager {

    // MARK: Properties

    static let shared = LoadingManager()

    private var showCount = 0

    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }()

    private lazy var window: UIWindow = {
       let window = UIWindow()
        window.backgroundColor = .clear
        window.rootViewController = generateVC()
        window.makeKeyAndVisible()
        window.windowLevel = .alert - 1
        return window
    }()

    private init() {}
}

// MARK: Publics

extension LoadingManager {

    func showIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.loadingIndicator.startAnimating()
            self.showCount += 1
            self.window.isHidden = false
        }
    }

    func hideIndicator() {
        DispatchQueue.main.async {[weak self] in
            guard let self else { return }
            self.showCount = self.showCount - 1 >= 0 ? (self.showCount - 1) : .zero
            self.window.isHidden = self.showCount <= 0
        }
    }
}

// MARK: Privates

private extension LoadingManager {

    func generateVC() -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        vc.view.addSubview(loadingIndicator)
        loadingIndicator.pinToSafeSuperView()
        return vc
    }
}
