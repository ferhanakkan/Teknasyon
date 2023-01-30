//
//  DetailViewModel.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
import Foundation

protocol DetailViewModelOutput: ViewModelOutputProtocol, AlertShowable, LoadingShowable {

    func updateDetailContainer(with viewModel: DetailContainerViewModel)
}

protocol DetailViewModelInput: ViewModelInputProtocol {

    var outputDelegate: DetailViewModelOutput? { get set }
    var data: DetailContainerViewModel? { get }
}

final class DetailViewModel: DetailViewModelInput {

    // MARK: Properties

    weak var outputDelegate: DetailViewModelOutput?

    private(set) var data: DetailContainerViewModel?

    private var detailRepository: DetailRepositoryInput
    private let id: Int

    // MARK: Initilizer

    init(
        detailRepository: DetailRepositoryInput = DetailRepository(),
        id: Int
    ) {
        self.detailRepository = detailRepository
        self.id = id
    }
}

// MARK: Publics

extension DetailViewModel {

    func viewDidLoad() {
        fetchData()
    }
}

// MARK: Privates

private extension DetailViewModel {

    func fetchData() {
        outputDelegate?.showLoading()
        detailRepository.fetchDetail(id: id) { [weak self] result in
            guard let self else { return }

            self.outputDelegate?.hideLoading()
            switch result {
            case .success(let data):
                guard let mappedData = DetailContainerViewModel(with: data) else {
                    return
                }
                self.data = mappedData
                self.outputDelegate?.updateDetailContainer(with: mappedData)

            case .failure(let error):
                self.outputDelegate?.showAlert(with: error.localizedDescription)
            }
        }
    }
}
