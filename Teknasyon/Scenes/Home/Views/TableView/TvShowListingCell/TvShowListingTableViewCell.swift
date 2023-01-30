//
//  TvShowListingTableViewCell.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import UIKit

final class TvShowListingTableViewCell: UITableViewCell {

    // MARK: Properties

    private lazy var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.addArrangedSubviews([
            nameLabel,
            ratingLabel
        ])
        return stackView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.textColor = .black
        label.textAlignment = .right
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Publics

extension TvShowListingTableViewCell {

    func configure(with viewModel: TvShowListingTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        ratingLabel.text = viewModel.userFriendlyRating
    }
}

// MARK: Privates

private extension TvShowListingTableViewCell {

    func configureLayout() {
        self.backgroundColor = .white

        self.accessoryType = .disclosureIndicator

        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false

        containerView.pinToSafeSuperView(
            edgeInset: .init(
                top: 10,
                left: 10,
                bottom: 10,
                right: 10
            )
        )
    }
}
