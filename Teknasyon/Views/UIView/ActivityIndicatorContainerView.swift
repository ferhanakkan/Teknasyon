//
//  ActivityIndicatorContainerView.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import UIKit

final class ActivityIndicatorContainerView: UIView {

    // MARK: Properties

    private let activityView = UIActivityIndicatorView(style: .medium)

    // MARK: Initlizer

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Publics

extension ActivityIndicatorContainerView {

    func startAnimating() {
        activityView.startAnimating()
    }
}

// MARK: Privates

private extension ActivityIndicatorContainerView {

    func configureLayout() {
        addSubview(activityView)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
