//
//  MainViewModel.swift
//  ApiLayerMVVM
//
//  Created by Егор Янкович on 1/27/21.
//

import Foundation

protocol EndPointType {
    var baseURL: String { get }
    var path: String { get }
    var params: URLQueryItem {get}
    var dataType: Decodable.Type {get}
}

