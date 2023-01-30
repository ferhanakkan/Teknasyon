//
//  MockHomeRepository.swift
//  TeknasyonTests
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
@testable import Teknasyon
import XCTest

final class MockHomeRepository: HomeRepositoryInput {

    // MARK: Properties

    var invokeLoadNextPageCount: Int = 0

    var activeRequest: URLSessionTask?
}

// MARK: Publics

extension MockHomeRepository {

    func loadNextPage(
        isInitial: Bool,
        completion: @escaping ValueCompletion<(Result<GetPopularTvShowsResponse, FANetworkError>)>
    ) {
        invokeLoadNextPageCount += 1

        guard let mockURL = URL(string: "www.google.com") else {
            completion(.failure(.serviceError))
            return
        }
        activeRequest = URLSession.shared.dataTask(with: mockURL)

        let response = GetPopularTvShowsResponse(
            page: 1,
            results: [
                .init(posterPath: "path", voteAverage: .zero, overview: "Overview", id: .zero, name: "Name"),
                .init(posterPath: "path", voteAverage: .zero, overview: "Overview", id: .zero, name: "Name"),
                .init(posterPath: "path", voteAverage: .zero, overview: "Overview", id: .zero, name: "Name"),
                .init(posterPath: "path", voteAverage: .zero, overview: "Overview", id: .zero, name: "Name"),
                .init(posterPath: "path", voteAverage: .zero, overview: "Overview", id: .zero, name: "Name"),
                .init(posterPath: "path", voteAverage: .zero, overview: "Overview", id: .zero, name: "Name")
            ],
            totalResults: 6,
            totalPages: 1,
            statusMessage: "Nothing"
        )

        activeRequest = nil
        completion(.success(response))
    }
}
