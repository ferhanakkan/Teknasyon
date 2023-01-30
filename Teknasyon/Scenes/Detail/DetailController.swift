//
//  DetailController.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
import UIKit

final class DetailController: UIViewController {

    // MARK: Properties

    private lazy var scrollView: CustomScrollView = {
        let view = CustomScrollView()
        return view
    }()

    private let detailContainer: DetailContainerView = {
        let view = DetailContainerView()
        return view
    }()

    private let viewModel: DetailViewModelInput

    // MARK: Initilizer

    init(viewModel: DetailViewModelInput) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        self.viewModel.outputDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
        configureLayout()
    }
}

// MARK: DetailViewModelOutput

extension DetailController: DetailViewModelOutput {

    func updateDetailContainer(with viewModel: DetailContainerViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.detailContainer.update(with: viewModel)
        }
    }
}

// MARK: Privates

private extension DetailController {

    func configureLayout() {
        title = "Detail"

        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.pinToSafeSuperView()

        scrollView.contentContainer.addSubview(detailContainer)
        detailContainer.pinToSafeSuperView()
    }
}
