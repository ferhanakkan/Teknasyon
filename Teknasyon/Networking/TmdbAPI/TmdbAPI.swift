//
//  TmdbAPI.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
import Foundation

protocol TmdbAPIInput {

  @discardableResult
  func fetchPopularTvShows(
    page: Int,
    completion: @escaping ValueCompletion<(
        Swift.Result<FANetworkResponse<GetPopularTvShowsRequest.ResponseType>, FANetworkError>
    )>
  ) -> URLSessionTask?

    func fetchTvShowDetail(
      showId: Int,
      completion: @escaping ValueCompletion<(
          Swift.Result<FANetworkResponse<GetTVShowDetailsRequest.ResponseType>, FANetworkError>
      )>
    )
}

final class TmdbAPI: TmdbAPIInput {

    private let networkManager: FANetworkManagerProtocol

    init(with networkManager: FANetworkManagerProtocol = FANetwork.shared) {
        self.networkManager = networkManager
    }
}

// MARK: Publics

extension TmdbAPI {

    @discardableResult
    func fetchPopularTvShows(
      page: Int,
      completion: @escaping ValueCompletion<(
        Result<FANetworkResponse<GetPopularTvShowsRequest.ResponseType>, FANetworkError>
      )>
    ) -> URLSessionTask? {
        let request = GetPopularTvShowsRequest(page: page)

        return networkManager.genericFetch(
            queue: .global(qos: .background),
            request,
            completion: completion
        )
    }

    func fetchTvShowDetail(
      showId: Int,
      completion: @escaping ValueCompletion<(
          Result<FANetworkResponse<GetTVShowDetailsRequest.ResponseType>, FANetworkError>
      )>
    ) {
        let request = GetTVShowDetailsRequest(tvId: showId)
        networkManager.genericFetch(
            queue: .global(qos: .background),
            request,
            completion: completion
        )
    }
}
