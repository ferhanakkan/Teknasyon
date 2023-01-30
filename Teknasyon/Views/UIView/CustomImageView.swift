//
//  CustomImageView.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import UIKit

final class CustomImageView: UIImageView {

    // MARK: Properties

    private let loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
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

// MARK: Publics

extension CustomImageView {

    func load(url: URL?) {
        loadingIndicator.startAnimating()
        DispatchQueue.global(qos: .background).async {
            guard
                let url,
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data)
            else {
                self.image = UIImage(named: "no-pictures")
                return
            }
            DispatchQueue.main.async {
                self.loadingIndicator.stopAnimating()
                self.image = image
            }
        }
    }
}

// MARK: Privates

private extension CustomImageView {

    func configureLayout() {
        addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
