//
//  GetTvShowsDetailsRequest.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation

struct GetTVShowDetailsRequest: TmdbRequest {

    // MARK: Typealias

    typealias ResponseType = GetTvShowDetailsResponse

    // MARK: Properties

    var path: String

    let httpMethod: FAHTTPMethod = .get

    let task: FAHTTPTask

    // MARK: Initilizer

    init(
        apiKey: String = Constants.API.key,
        tvId: Int
    ) {
        path = "tv/\(tvId)"

        task = .requestParameters(
            bodyParameters: nil,
            bodyEncoding: .urlEncoding,
            urlParameters: [
                "api_key": apiKey
            ],
            parametersAsBodyData: nil
        )
    }
}
