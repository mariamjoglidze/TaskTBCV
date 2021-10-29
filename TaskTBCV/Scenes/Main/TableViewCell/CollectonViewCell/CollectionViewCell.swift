//
//  CollectionViewCell.swift
//  TaskTBCV
//
//  Created by Mariam Joglidze on 28.10.21.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func onItemTapped(_ person: Person)
}

class CollectionViewCellObject {
    var person: Person
    weak var delegate: CollectionViewCellDelegate?
    
    init(person: Person, delegate: CollectionViewCellDelegate? = nil){
        self.person = person
        self.delegate = delegate
}
}

class CollectionViewCell: UICollectionViewCell {
    weak var delegate: CollectionViewCellDelegate?
    @IBOutlet weak var nameLabel: UILabel!
    
    var person: Person?
    
    func configure(_ object: CollectionViewCellObject) {
        self.delegate = object.delegate
        self.person = object.person
        nameLabel.text = object.person.name
    }
    
    @IBAction private func onItemTapped() {
        guard let person = self.person else {
            return
        }
        delegate?.onItemTapped(person)
    }
}
