//
//  ApiLayerViewModel.swift
//  ApiLayerMVVM
//
//  Created by Егор Янкович on 1/27/21.
//

import Foundation

class ApiLayerMVVMViewModel: NSObject {
    
    private var networkManager: MakeRequest!
    private(set) var filmList: [Results] = [] {
        didSet {
            self.bindFilmViewModelToController()
        }
    }
    
    var bindFilmViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.networkManager = MakeRequest()
        getData()
    }
    
    func getData()  {
        loadTableData { [weak self] (list, error) in
            self?.filmList = list ?? []
        }
    }
    
    func loadTableData(_ completion: (([Results]?, Error?)->())?) {
        networkManager.request(for: .getFilmList(page: 1, type: FilmListModel.self), completed: { result in
            var filmList: [Results] = []
            switch result {
            case.success(let array):
                filmList = array.filter{$0.results != nil}.reduce(into: filmList) { (r, f) in
                    r.append(contentsOf: f.results!)
                }
                completion?(filmList, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        })
    }
}
