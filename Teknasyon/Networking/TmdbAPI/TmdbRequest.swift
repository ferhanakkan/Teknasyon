//
//  TmdbRequest.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import FAFoundation
import Foundation

protocol TmdbRequest: FAEndpoint {}

// MARK: Publics

extension TmdbRequest {

    // MARK: Properties

    var baseHeaders: FAHTTPHeaders? {
        .init(headers: [])
    }

    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/") else {
            fatalError("There is an issue with URL !!!")
        }
        return url
    }

    var timeout: TimeInterval {
        30
    }
}
