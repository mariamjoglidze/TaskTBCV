//
//  ViewController.swift
//  TaskTBCV
//
//  Created by Mariam Joglidze on 28.10.21.
//

import UIKit

class ViewController: UIViewController, CollectionViewCellDelegate {
   

    var persons = [Person(name: "mariami"), Person(name: "lizi"), Person(name: "ana")]
//    var persons = [CollectionViewCellObject]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(class: TableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
            }
    
    func onItemTapped(_ person: Person) {
        let sb = UIStoryboard(name: "DetailScreen", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.personName = person
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
   
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.deque(TableViewCell.self, for: indexPath)
        var items = [CollectionViewCellObject]()
        self.persons.forEach {_ in
            items.append(
                .init(person: Person(name: "Mariami"), delegate: self)
            )
        }
        cell.items = items
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}


