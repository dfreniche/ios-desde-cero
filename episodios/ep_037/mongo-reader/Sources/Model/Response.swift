//
//  Response.swift
//  mongoreader
//
//  Created by Diego Freniche Brito on 19/9/22.
//  Copyright © 2022 Diego Freniche. All rights reserved.
//

import Foundation

struct Response: Decodable {
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "documents"
    }
}
