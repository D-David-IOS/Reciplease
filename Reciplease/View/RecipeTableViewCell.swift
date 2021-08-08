//
//  RecipeTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 08/08/2021.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
 
    
    @IBOutlet weak var titleCell: UILabel!
    
    @IBOutlet weak var descriptionCell : UILabel!
    
    @IBOutlet weak var imageCell : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



}
