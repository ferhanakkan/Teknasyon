//
//  DetailContainerViewModel.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import Foundation

struct DetailContainerViewModel {

    let imageURL: URL?
    let name: String
    let description: String
}

extension DetailContainerViewModel {

    init?(with response: GetTvShowDetailsResponse) {
        guard
            let name = response.name,
            let description = response.overview,
            let posterPath = response.posterPath
        else {
            return nil
        }
        self.name = name
        self.description = description
        self.imageURL = .init(string: Constants.API.imageURL + posterPath)
    }
}
