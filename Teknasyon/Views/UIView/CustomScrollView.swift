//
//  CustomScrollView.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import UIKit

final class CustomScrollView: UIScrollView {

    // MARK: Properties

    lazy var contentContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    // MARK: Initilizer

    init() {
        super.init(frame: .zero)

        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Privates

private extension CustomScrollView {

    func configureLayout() {
        addSubview(contentContainer)
        contentContainer.pinToSuperView()
        contentContainer.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
}
