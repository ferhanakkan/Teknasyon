//
//  MockDetailRepository.swift
//  TeknasyonTests
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
@testable import Teknasyon
import XCTest

final class MockDetailRepository: DetailRepositoryInput {

    // MARK: Properties

    var invokeFetchDetailCount: Int = 0

    var activeRequest: URLSessionTask?
}

// MARK: Publics

extension MockDetailRepository {

    func fetchDetail(
        id: Int,
        completion: @escaping ValueCompletion<(Result<GetTvShowDetailsResponse, FANetworkError>)>
    ) {
        invokeFetchDetailCount += 1

        guard let mockURL = URL(string: "www.google.com") else {
            completion(.failure(.serviceError))
            return
        }
        activeRequest = URLSession.shared.dataTask(with: mockURL)

        let response: GetTvShowDetailsResponse = .init(
            id: .zero,
            name: "Name",
            overview: "Overview",
            posterPath: "path", statusMessage: "nothing"
        )
        activeRequest = nil
        completion(.success(response))
    }
}
