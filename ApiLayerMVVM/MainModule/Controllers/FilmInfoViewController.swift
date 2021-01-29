//
//  FilmInfoViewController.swift
//  ApiLayerMVVM
//
//  Created by Егор Янкович on 1/28/21.
//

import UIKit

class FilmInfoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voiteAvgLabel: UILabel!
    @IBOutlet weak var voiteCountLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UITextView!
    
    private var infoModel: FilmInfoViewModel!
    var name: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        self.infoModel = FilmInfoViewModel()

    }
    
    func updateDataSource() {
        let array = infoModel.filmInfo
        array.forEach {
            self.titleLabel.text = $0.title
            self.voiteAvgLabel.text = String($0.voteAverage!)
            self.voiteCountLabel.text = String($0.voteCount!)
            self.descriptionTextLabel.text = $0.overview
        }
    }
}
