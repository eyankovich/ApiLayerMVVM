//
//  ApiRequestManager.swift
//  ApiLayerMVVM
//
//  Created by Егор Янкович on 1/27/21.
//

import Foundation

enum RequestType<T: Decodable> {
    case getMovie(id:Int, type: T.Type)
    case getVideos(id:Int, type: T.Type)
    case getFilmList(page: Int, type: T.Type)
}

extension RequestType: EndPointType {
    
    var dataType: Decodable.Type {
        switch self {
        case .getMovie(_, let type):
            return type
        case .getVideos(_, let type):
            return type
        case .getFilmList(_, let type):
            return type
        }
    }
    
    var params: URLQueryItem {
        .init(name: "api_key", value: CodingValues.getvalue(for: "APIKey") )
    }
    
    var baseURL: String {
        CodingValues.getvalue(for: "BaseURL")!
    }
    
    var path: String {
        switch self {
        case .getMovie(let id, _):
            return "/3/movie/\(id)"
        case .getVideos(let id, _):
            return "/3/movie/\(id)/videos"
        case .getFilmList( _, _):
            return "/3/movie/popular"
        }
    }
}
