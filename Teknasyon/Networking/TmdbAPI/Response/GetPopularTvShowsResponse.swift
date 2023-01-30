//
//  GetPopularTvShowsResponse.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import Foundation

// MARK: - GetPopularTvShowsResponse

struct GetPopularTvShowsResponse: Codable {

    let page: Int?
    let results: [PopularTvShowResult]?
    let totalResults: Int?
    let totalPages: Int?
    let statusMessage: String?

    enum CodingKeys: String, CodingKey {

        case page
        case results
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case statusMessage = "status_message"
    }
}
