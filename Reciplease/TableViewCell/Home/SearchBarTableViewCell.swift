//
//  SearchBarTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import UIKit

// represent the Home page without the button on the bottom
class SearchBarTableViewCell: UITableViewCell, UISearchBarDelegate, UITableViewDelegate,UITableViewDataSource   {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var ingredientTableview: UITableView!
    
    // only 1 section we don't need more
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        // the ingredient number to display
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ingredientManager.shared.size()
        }
        
        // configure the cell
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientSearchTableViewCell
            
            let ingredient = "      - " + ingredientManager.shared.valueAtIndex(index: indexPath.row)
            
            cell.IngredientLabel.text = ingredient
            return cell
        }
    
    // configure the cell
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
       
        searchBar.delegate = self
        ingredientTableview.separatorColor = .none
        ingredientTableview.delegate = self
        ingredientTableview.dataSource = self
        ingredientTableview.register(UINib(nibName: "IngredientSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "IngredientCell")
    }
    
    // Dissmiss the Keyboard when user tap on return
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    // clear all ingredients in the TableView
    @IBAction func clearButton(_ sender: Any) {
        ingredientManager.shared.clear()
        ingredientTableview.reloadData()
    }
    
    // add a new ingredient in the array in IngredientManager
    @IBAction func addButton(_ sender: Any) {
        
        guard let text = searchBar.text, text != "" else {
            return
        }
        
        ingredientManager.shared.add(ingredient: text)
        searchBar.text = ""
        ingredientTableview.reloadData()
    }
}
