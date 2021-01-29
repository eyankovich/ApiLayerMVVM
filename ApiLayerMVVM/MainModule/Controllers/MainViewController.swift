//
//  MainViewController.swift
//  ApiLayerMVVM
//
//  Created by Егор Янкович on 1/27/21.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var filmListTable: UITableView!
    private var listModel: ApiLayerMVVMViewModel!
    private var dataSource : FilmListTableViewDataSource<CellFilmTable,Results>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    @IBAction func loadButton(_ sender: Any) {
        callToViewModelForUIUpdate()
        updateDataSource()
    }
    
    func callToViewModelForUIUpdate(){
        self.listModel = ApiLayerMVVMViewModel()
        self.listModel.bindFilmViewModelToController = {
        self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        
        self.dataSource = FilmListTableViewDataSource(cellIdentifier: "FilmListCell", items:
             self.listModel.filmList, configureCell: {(cell, env) in
             cell.filmTitle.text = env.title
        })
        DispatchQueue.main.async {
            self.filmListTable.dataSource = self.dataSource
            self.filmListTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(identifier: "FilmInfoViewController") as? FilmInfoViewController else { return }
        secondViewController.name = listModel.filmList[indexPath.row].id ?? 0
        
        show(secondViewController, sender: nil)
        let vc = FilmInfoViewController()
        present(vc, animated: true)
        vc.modalPresentationStyle = .custom
    }
    
}
