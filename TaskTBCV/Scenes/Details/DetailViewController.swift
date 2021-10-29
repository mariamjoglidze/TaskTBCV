//
//  DetailViewController.swift
//  TaskTBCV
//
//  Created by Mariam Joglidze on 28.10.21.
//

import UIKit

class DetailViewController: UIViewController {
   
    @IBOutlet weak var detailLabel: UILabel!
    
    var personName: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = personName?.name
    }
    

}
