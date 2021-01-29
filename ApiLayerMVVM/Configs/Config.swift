//
//  Config.swift
//  ApiLayerMVVM
//
//  Created by Егор Янкович on 1/27/21.
//

import Foundation

struct CodingValues {
    
    static func getvalue(for key: String) -> String? {
        return Bundle.main.infoDictionary?[key] as? String
    }
}
