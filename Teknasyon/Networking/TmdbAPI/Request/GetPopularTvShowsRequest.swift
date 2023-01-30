//
//  GetPopularTvShowsRequest.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation

struct GetPopularTvShowsRequest: TmdbRequest {

    // MARK: Typealias

    typealias ResponseType = GetPopularTvShowsResponse

    // MARK: Properties

    let path: String = "tv/popular"

    let httpMethod: FAHTTPMethod = .get

    let task: FAHTTPTask

    // MARK: Initilizer

    init(
        apiKey: String = Constants.API.key,
        page: Int
    ) {
        task = .requestParameters(
            bodyParameters: nil,
            bodyEncoding: .urlEncoding,
            urlParameters: [
                "api_key": apiKey,
                "page": page
            ],
            parametersAsBodyData: nil
        )
    }
}
