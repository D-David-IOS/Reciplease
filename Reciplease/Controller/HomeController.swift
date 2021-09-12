//
//  HomeController.swift
//  Reciplease
//
//  Created by David-IOS on 06/08/2021.
//

import UIKit
import Alamofire

class HomeController: UIViewController,UINavigationControllerDelegate  {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchRecipe: UIButton!
    
    @IBOutlet weak var addIngredientButton: UIButton!
    
    @IBOutlet weak var ingredientTextField: UITextField!
    
    @IBOutlet weak var clearButton: UIButton!
    
  
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Papyrus", size: 20)!, .foregroundColor: UIColor.white]
        self.navigationController?.title = "Reciplease"
       
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    @IBAction func addButton(_ sender: Any) {
        
        guard let ingredient = ingredientTextField.text else {
            return
        }
        
        guard ingredient != "" else {
            return
        }
        
        ingredientManager.shared.add(ingredient: ingredient)
        ingredientTextField.text = ""
        tableView.reloadData()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        ingredientManager.shared.clear()
        tableView.reloadData()
    }
    
    
    
    @IBAction func searchButton(_ sender: Any) {
        let routingEntry = RecipListRoutingEntry()
        let navController = self.navigationController
     
        let newRouting = Routing()
        let navStyle = PushNavigationStyle(fromNVC: navController!,
                                           routingEntry: routingEntry)
        
        _ = newRouting
            .route(navigationStyle: navStyle,
                   animated: true)
    }
    
}

extension HomeController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientManager.shared.size()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        
        let ingredient = "      - " + ingredientManager.shared.valueAtIndex(index: indexPath.row)
        
        cell.textLabel?.text = ingredient
        
        return cell
    }
    
}
