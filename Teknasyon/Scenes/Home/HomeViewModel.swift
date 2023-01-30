//
//  HomeViewModel.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
import Foundation

protocol HomeViewModelOutput: ViewModelOutputProtocol, AlertShowable, LoadingShowable {

    func reloadTableView(completion: @escaping VoidCompletion)
    func setFooterView(isLoadingEnable: Bool)
    func insertTableViewRows(in range: ClosedRange<Int>)
    func endRefreshControlRefreshing()
}

protocol HomeViewModelInput: ViewModelInputProtocol {

    var datas: [TvShowListingTableViewCellViewModel] { get }
    var outputDelegate: HomeViewModelOutput? { get set }
    func didSelectedAt(indexPath: IndexPath)
    func didChangeRefreshValue(isRefreshing: Bool)
    func willDisplayCellAt(indexPath: IndexPath)
    func fetchData(isInitial: Bool)
}

final class HomeViewModel: HomeViewModelInput {

    // MARK: Properties

    weak var outputDelegate: HomeViewModelOutput?

    private(set) var datas: [TvShowListingTableViewCellViewModel] = []

    private var homeRepository: HomeRepositoryInput
    private weak var coordinator: Coordinator?

    // MARK: Initilizer

    convenience init(coordinator: Coordinator) {
        self.init(
            homeRepository: HomeRepository(),
            coordinator: coordinator
        )
    }

    init(
        homeRepository: HomeRepositoryInput,
        coordinator: Coordinator
    ) {
        self.homeRepository = homeRepository
        self.coordinator = coordinator
    }

    func viewDidLoad() {
        outputDelegate?.showLoading()
        fetchData(isInitial: true)
    }
}

// MARK: Publics

extension HomeViewModel {

    func didSelectedAt(indexPath: IndexPath) {
        let selectedData = datas[indexPath.row]
        coordinator?.showDetails(with: selectedData.id)
    }

    func willDisplayCellAt(indexPath: IndexPath) {
        guard
            indexPath.row == datas.count,
            homeRepository.activeRequest.isNil
        else {
            return
        }
        outputDelegate?.setFooterView(isLoadingEnable: true)
        fetchData()
    }

    func didChangeRefreshValue(isRefreshing: Bool) {
        fetchData(isInitial: true)
    }

    func fetchData(isInitial: Bool = false) {
        homeRepository.loadNextPage(
            isInitial: isInitial
        ) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                guard let results = response.results else {
                    if self.datas.isEmpty {
                        self.outputDelegate?.showAlert(with: Constants.Home.emptyError)
                    }
                    return
                }
                isInitial ?
                (self.deleteAllData { self.handleNewData(with: results) }) :
                self.handleNewData(with: results)

            case .failure(let error):
                self.outputDelegate?.showAlert(
                    with: Constants.Home.unexpectedError + error.localizedDescription
                )
            }

            if isInitial {  self.outputDelegate?.hideLoading() }
            self.outputDelegate?.endRefreshControlRefreshing()
        }
    }
}

// MARK: Privates

private extension HomeViewModel {

    @inline(__always) func deleteAllData(completion: @escaping VoidCompletion) {
        datas.removeAll()
        outputDelegate?.reloadTableView(completion: completion)
    }

    @inline(__always) func handleNewData(with results: [PopularTvShowResult]?) {
        guard let results else { return }
        let newDatas = results.compactMap(TvShowListingTableViewCellViewModel.init)
        self.datas.append(contentsOf: newDatas)

        guard self.datas.isNotEmpty else {
            return
        }

        let startsAt = self.datas.count - newDatas.count
        let finishAt = self.datas.count - 1

        self.outputDelegate?.insertTableViewRows(
            in: startsAt...finishAt
        )
    }
}
