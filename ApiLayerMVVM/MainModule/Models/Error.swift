//
//  Error.swift
//  ApiLayerMVVM
//
//  Created by Егор Янкович on 1/27/21.
//

import Foundation

struct ErrorModel: Codable {
    var statusCode: Int
    var statusMessage: String
}
