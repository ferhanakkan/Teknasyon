//
//  UIKit+Extensions.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import UIKit

extension UIView {

    func pinToSafeSuperView(edgeInset: UIEdgeInsets = .zero) {
        guard let superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        let superSafe = superview.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superSafe.leadingAnchor, constant: edgeInset.left),
            trailingAnchor.constraint(equalTo: superSafe.trailingAnchor, constant: -edgeInset.right),
            topAnchor.constraint(equalTo: superSafe.topAnchor, constant: edgeInset.top),
            bottomAnchor.constraint(equalTo: superSafe.bottomAnchor, constant: -edgeInset.bottom)
        ])
    }
}
