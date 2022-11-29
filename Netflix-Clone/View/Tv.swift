//
//  Tv.swift
//  Netflix-Clone
//
//  Created by User-P2 on 11/16/22.
//

import Foundation

struct TrendingTv: Codable {
    let Tvs: [Tv]
    
    enum CodingKeys: String, CodingKey {
        case Tvs = "results"
    }
    
}

struct Tv: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_lenguaje: String?
    let overview: String?
    let backdrop_path: String?
    let poster_path: String?
    let first_air_date: String?
}
