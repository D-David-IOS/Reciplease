//
//  SearchBarTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import UIKit

class SearchBarTableViewCell: UITableViewCell, UISearchBarDelegate, UITableViewDelegate,UITableViewDataSource   {
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ingredientManager.shared.size()
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientSearchTableViewCell
            
            let ingredient = "      - " + ingredientManager.shared.valueAtIndex(index: indexPath.row)
            
            cell.IngredientLabel.text = ingredient
            return cell
        }

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var ingredientTableview: UITableView!
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
       
        searchBar.delegate = self
        ingredientTableview.separatorColor = .none
        ingredientTableview.delegate = self
        ingredientTableview.dataSource = self
        ingredientTableview.register(UINib(nibName: "IngredientSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "IngredientCell")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        ingredientManager.shared.clear()
        ingredientTableview.reloadData()
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        
        guard let text = searchBar.text, text != "" else {
            return
        }
        
        ingredientManager.shared.add(ingredient: text)
        searchBar.text = ""
        ingredientTableview.reloadData()
    }
}
