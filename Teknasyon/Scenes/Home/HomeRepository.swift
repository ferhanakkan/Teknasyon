//
//  HomeRepository.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
import Foundation

protocol HomeRepositoryInput {

    var activeRequest: URLSessionTask? { get }
    func loadNextPage(
        isInitial: Bool,
        completion: @escaping ValueCompletion<(
            Result<GetPopularTvShowsResponse, FANetworkError>
        )>
    )
}

final class HomeRepository: HomeRepositoryInput {

    // MARK: Properties

    private var tmdbAPI: TmdbAPIInput
    private(set) var activeRequest: URLSessionTask?
    private var currentPage: Int = .zero
    private var hasMorePage = false

    init(tmdbAPI: TmdbAPIInput = TmdbAPI()) {
        self.tmdbAPI = tmdbAPI
    }
}

// MARK: Publics

extension HomeRepository {

    func loadNextPage(
        isInitial: Bool,
        completion: @escaping ValueCompletion<(
            Result<GetPopularTvShowsResponse, FANetworkError>
        )>
    ) {
        guard !hasMorePage else {
            return
        }

        if isInitial {
            activeRequest?.cancel()
            currentPage = 1
        }

        activeRequest = tmdbAPI.fetchPopularTvShows(
            page: currentPage,
            completion: { [weak self] result in
                guard let self else { return }

                switch result {
                case .success(let data):
                    self.currentPage += 1
                    self.hasMorePage = data.response.page == data.response.totalPages
                    completion(.success(data.response))

                case .failure(let error):
                    self.hasMorePage = false
                    completion(.failure(error))
                }
                self.activeRequest = nil
            })
    }
}
