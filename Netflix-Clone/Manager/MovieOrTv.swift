//
//  Movie.swift
//  Netflix-Clone
//
//  Created by User-P2 on 11/15/22.
//

import Foundation

struct MovieOrTvRequest: Codable {
    let MoviesOrTvs: [MovieOrTv]
    
    enum CodingKeys: String, CodingKey {
        case MoviesOrTvs = "results"
    }
}

struct MovieOrTv: Codable {
    let id: Int
    let name: String?
    let title: String?
    let backdrop_path: String?
    let overview: String?
    let poster_path: String?
    let media_type: String?
}
