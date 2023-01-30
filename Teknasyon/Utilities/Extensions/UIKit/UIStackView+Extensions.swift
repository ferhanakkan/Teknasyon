//
//  UIStackView+Extensions.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import UIKit

extension UIStackView {

    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach { self.addArrangedSubview($0) }
    }
}
