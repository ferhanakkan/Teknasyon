//
//  GetTvShowDetailsResponse.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

struct GetTvShowDetailsResponse: Codable {

    let id: Int?
    let name: String?
    let overview: String?
    let posterPath: String?
    let statusMessage: String?

    enum CodingKeys: String, CodingKey {

        case id
        case name
        case posterPath = "poster_path"
        case overview
        case statusMessage = "status_message"
    }
}
