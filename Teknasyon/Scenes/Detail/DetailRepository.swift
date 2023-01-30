//
//  DetailRepository.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
import Foundation

protocol DetailRepositoryInput {
    func fetchDetail(
        id: Int,
        completion: @escaping ValueCompletion<(
            Result<GetTvShowDetailsResponse, FANetworkError>
        )>
    )
}

final class DetailRepository: DetailRepositoryInput {

    // MARK: Properties

    private var tmdbAPI: TmdbAPIInput

    // MARK: Initilizer

    init(tmdbAPI: TmdbAPIInput = TmdbAPI()) {
        self.tmdbAPI = tmdbAPI
    }
}

// MARK: Publics

extension DetailRepository {

    func fetchDetail(
        id: Int,
        completion: @escaping ValueCompletion<(
            Result<GetTvShowDetailsResponse, FANetworkError>
        )>) {
            tmdbAPI.fetchTvShowDetail(showId: id) { result in
                switch result {
                case .success(let data):
                    completion(.success(data.response))

                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
