//
//  Video.swift
//  ApiLayerMVVM
//
//  Created by Егор Янкович on 1/27/21.
//

import Foundation

struct VideoModel: Codable {
    var id: Int
    var results: [ResultArray]
}

struct ResultArray: Codable {
    var id: String
    var iso6391: String
    var iso31661: String
    var key: String
    var name: String
    var site: String
    var size: Int
    var type: String
}
