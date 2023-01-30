//
//  DetailContainerView.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import UIKit

final class DetailContainerView: UIView {

    // MARK: Properties

    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.addArrangedSubviews([
            imageView,
            nameLabel,
            descriptionLabel,
            UIView()
        ])
        return stackView
    }()

    private let imageView: CustomImageView = {
        let view = CustomImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
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

extension DetailContainerView {

    func update(with viewModel: DetailContainerViewModel) {
        imageView.load(url: viewModel.imageURL)
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
    }
}

// MARK: Privates

private extension DetailContainerView {

    func configureLayout() {
        addSubview(containerStackView)
        containerStackView.pinToSafeSuperView(
            edgeInset: .init(
                top: .zero,
                left: 20,
                bottom: .zero,
                right: 20
            )
        )

        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageViewHeight = UIScreen.main.bounds.height * 0.3
        imageView.heightAnchor.constraint(equalToConstant: imageViewHeight).isActive = true
    }
}
