//
//  Movie.swift
//  mongoreader
//
//  Created by Diego Freniche Brito on 19/9/22.
//  Copyright © 2022 Diego Freniche. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let _id: String
    let title: String
    let imdb: Imdb
    let year: Int
    
//    enum CodingKeys: String, CodingKey {
////        case id = "_id"
//    }
}
