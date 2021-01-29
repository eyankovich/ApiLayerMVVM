//
//  File.swift
//  ApiLayerMVVM
//
//  Created by Егор Янкович on 1/28/21.
//

import Foundation

class FilmInfoViewModel: NSObject {
    
    private var networkManager: MakeRequest!
    private(set) var filmInfo: [Movie] = [] {
        didSet {
            self.bindFilmInfoViewModelToController()
        }
    }
    var bindFilmInfoViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.networkManager = MakeRequest()
        loadData()
    }
    
    private func loadData() {
       let currentId = 550
        networkManager.request(for: .getMovie(id: currentId, type: Movie.self), completed: { result
            in switch result {
            case.success(let array):
                print(array)
                self.filmInfo = array
            case .failure(let error):
                print (error)
            }
        })
    }
    
}
