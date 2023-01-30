//
//  AlertManager.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
import UIKit

final class AlertManager {

    static let shared = AlertManager()

    private var cachedAlerts: [UIAlertController?] = []

    private lazy var window: UIWindow = {
        let window = UIWindow()
        window.backgroundColor = .clear
        window.makeKeyAndVisible()
        window.windowLevel = .alert + 1
        window.rootViewController = mockVC
        return window
    }()

    private var mockVC: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        return vc
    }()

    private init() {}
}

// MARK: Publics

extension AlertManager {

    func showInfoAlert(
        title: String? = nil,
        message: String,
        primaryActionTitle: String = "OK",
        primaryAction: VoidCompletion? = nil,
        preferedStyle: UIAlertController.Style = .alert
    ) {
        let primaryAction = UIAlertAction(title: primaryActionTitle, style: .default) { _ in
            primaryAction?()
        }

        self.showAlert(
            preferedStyle: preferedStyle,
            actions: [
                primaryAction
            ],
            title: title,
            message: message
        )
    }

    func showAlert(
        title: String? = nil,
        message: String,
        actions: [UIAlertAction],
        preferCancelButton: Bool = true,
        cancelButtonTitle: String = "Cancel",
        cancelAction: VoidCompletion? = nil,
        preferedStyle: UIAlertController.Style = .alert
    ) {

        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
            cancelAction?()
        }
        let finalActions = actions + [cancelAction]
        self.showAlert(
            preferedStyle: preferedStyle
            , actions: finalActions,
            title: title,
            message: message
        )
    }

    public func showAlert(
        title: String? = nil,
        message: String,
        primaryActionTitle: String = "OK",
        primaryAction: VoidCompletion? = nil,
        secondaryActionTitle: String = "Cancel",
        secondaryAction: VoidCompletion? = nil,
        preferedStyle: UIAlertController.Style = .alert
    ) {
        let primaryAction = UIAlertAction(title: primaryActionTitle, style: .default) { _ in
            primaryAction?()
        }

        let secondaryAction = UIAlertAction(title: secondaryActionTitle, style: .default) { _ in
            secondaryAction?()
        }

        self.showAlert(
            preferedStyle: preferedStyle,
            actions: [
                primaryAction,
                secondaryAction
            ],
            title: title,
            message: message
        )
    }

    func showAlert(
        title: String? = nil,
        message: String,
        primaryActionTitle: String?,
        primaryAction: VoidCompletion? = nil,
        secondaryActionTitle: String?,
        secondaryAction: VoidCompletion? = nil,
        preferedStyle: UIAlertController.Style = .alert
    ) {
        var actions: [UIAlertAction] = []

        if let primaryActionTitle {
            let primaryAction = UIAlertAction(title: primaryActionTitle, style: .default) {_ in
                primaryAction?()
            }
            actions.append(primaryAction)
        }

        if let secondaryActionTitle {
            let secondaryAction = UIAlertAction(title: secondaryActionTitle, style: .default) { _ in
                secondaryAction?()
            }
            actions.append(secondaryAction)
        }

        self.showAlert(preferedStyle: preferedStyle, actions: [], title: title, message: message)
    }
}

// MARK: Privates

private extension AlertManager {
    func showAlert(
        preferedStyle: UIAlertController.Style,
        actions: [UIAlertAction],
        title: String? = nil,
        message: String? = nil
    ) {
        let alert = CustomAlertController(
            title: title,
            message: message,
            preferredStyle: preferedStyle
        )

        alert.dismissHandler = { [weak self] in
            self?.hideAlertWindow()
        }

        actions.forEach { action in
            alert.addAction(action)
        }

        cachedAlerts.append(alert)
        showAlertWindow()
    }

    func showAlertWindow() {
        guard self.cachedAlerts.count <= 2 else { return }
        window.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self else { return }
            self.window.rootViewController?.present(self.cachedAlerts.first!!, animated: true)
        }
    }

    func hideAlertWindow() {
        cachedAlerts.removeFirst()
        window.isHidden = cachedAlerts.isEmpty
        window.rootViewController = mockVC
        guard self.cachedAlerts.isNotEmpty else { return }
        self.window.rootViewController?.present(self.cachedAlerts.first!!, animated: true)
    }
}
