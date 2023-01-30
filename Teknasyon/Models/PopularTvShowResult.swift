//
//  PopularTvShowResult.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import Foundation

struct PopularTvShowResult: Codable {

    let posterPath: String?
    let voteAverage: Double?
    let overview: String?
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {

        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case overview
        case name
        case id
    }
}
