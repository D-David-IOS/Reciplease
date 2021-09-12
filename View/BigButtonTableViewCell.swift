//
//  BigButtonTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import UIKit

class BigButtonTableViewCell: UITableViewCell {

   
    @IBOutlet weak var bigButton: UIButton!
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        print("get direction !")
    }
}
