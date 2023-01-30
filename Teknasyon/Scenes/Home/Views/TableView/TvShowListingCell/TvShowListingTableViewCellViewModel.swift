//
//  TvShowListingTableViewCellViewModel.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

struct TvShowListingTableViewCellViewModel {

    let name: String
    let rating: Double
    let id: Int

    var userFriendlyRating: String {
        "Rating: \(rating)"
    }
}

extension TvShowListingTableViewCellViewModel {

    init?(with result: PopularTvShowResult) {
        guard
            let name = result.name,
            let rating = result.voteAverage,
            let id = result.id
        else {
            return nil
        }
        self.name = name
        self.rating = rating
        self.id = id
    }
}
