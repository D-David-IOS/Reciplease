//
//  TableViewController.swift
//  Reciplease
//
//  Created by David-IOS on 19/10/2021.
//

import UIKit

// the unique Controller in the app
// used in all Pages
class TableViewController: UIViewController {

    // the TableView where all Cell will be display
    @IBOutlet weak var tableView: UITableView!
    
    // the viewModel, contains all informations about the current page
    var viewModel: ScrollableViewModel?
    
    init(viewModel: ScrollableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "TableViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // in the ViewWillAppear we registers the cells and reloadData
    // only if the viewModel is FavoriteRecipViewModel
    // so when user add a Favorite, the page is refresh with the new Favorite
    override func viewWillAppear(_ animated: Bool) {
        guard ((self.viewModel as? FavoriteRecipViewModel) == nil) else {
            
            // load the data and register cells
            self.viewModel?.loadData { [weak self] in
                self?.registerCells()
                self?.tableView.reloadData()
            }
            super.viewWillAppear(animated)
            navigationItem.title = "Favorite"
            return
        }
        super.viewWillAppear(animated)
        navigationItem.title = "Reciplease"
       }
    
    // Load all data in the ViewModel except FavoriteRecipViewModel, we do it in viewWillAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 0.2160621881, green: 0.2001904547, blue: 0.196036458, alpha: 1)
        tableView.separatorColor = .none
        tableView.delegate = self
        tableView.dataSource = self
        guard ((self.viewModel as? FavoriteRecipViewModel) != nil) else {
            // load the data and register cells
            self.viewModel?.loadData { [weak self] in
                self?.registerCells()
                self?.tableView.reloadData()
            }
            return
        }
    }

    public func registerCells() {
        guard let sections = self.viewModel?.sections else { return }
        
        for i in 0..<sections.count {
            let section = sections[i]
            
            let items = section.cellsVM
            
            for j in 0..<items.count {
                let item = items[j]
                
                // We store index path for item
                item.indexPath = IndexPath(row: j,
                                           section: i)
                
                // If we don't have a nibName, we use the default UITableViewCell
                guard let nibName = item.nibName else {
                    tableView.register(UITableViewCell.self,
                                       forCellReuseIdentifier: item.reuseIdentifier)
                    continue
                }
                         
                // Otherwise we use the one from the xib
                let nib = UINib(nibName: nibName,
                                bundle: Bundle(for: type(of: item)))
                self.tableView.register(nib,
                                        forCellReuseIdentifier: item.reuseIdentifier)
            }
        }
    }
}

// all TableView Functions
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // the number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfSections()
    }
    
    // the numbers of items in the section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfItems(in: section)
    }
    
    // the cell at the IndexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return UITableViewCell()
        }
        
        let reuseIdentifier = cellVM.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                 for: indexPath)
        
        // here we call the function LoadMore for add 20 new cells in the tableview
        // it happen only if the user scroll to the bottom
        if let vm = self.viewModel as? ListRecipViewModel  {
            
            // for each Section we have a new indexPath( 0 - 20 )
            // when the indexPath is 18 we add 20 new cells
            // for not create an infinite loop we have to wait the data finished to load the new Section
            // the function LoadMore is called next time in the next Section at index 18 too
            if cellVM.indexPath!.row == (18) && cellVM.indexPath?.section == vm.sections.count-1 && !vm.isLoading {
                vm.isLoading = true
                vm.loadMore {
                    self.registerCells()
                    self.tableView.reloadData()
                }
            }
        }
        
        return cell
    }
    
    // Configure the cell, with the informations present in the CellViewModel
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
        cell.configure(cellViewModel: cellVM,
                       from: self)
    }
    
    // add an action when user tap one the cell
    // the action is definited in the cellViewModel with a Routing Entry
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
                        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellVM.reuseIdentifier)
        cell?.cellPressed(cellViewModel: cellVM,
                          from: self)
    }
    
    // Return the heigth for the cell
    // this information is present in the CellViewModel
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableCellViewModel else {
            return UITableView.automaticDimension
        }
        
        return CGFloat(cellVM.height)
    }
    
    // with a swap on the left the user can choose an action
    // here only the action Delete is present
    // only TableEditedCellViewModel can be delete ( in Favorite so )
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? FavoriteCellViewModel else {
            return
        }
        
        if editingStyle == .delete {
            // the context
            let context = AppDelegate.viewContext
            // remove the Favorite Recipe in the context
            context.delete(cellVM.favorite)
            // save the context with changes
            try? AppDelegate.viewContext.save()
            // remove the cell in the TableView
            self.viewModel?.remove(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if self.viewModel?.sections[0].cellsVM.count == 0 {
                self.viewModel?.loadData{ [weak self] in
                    self?.registerCells()
                    self?.tableView.reloadData()
                }
            }
        }
        
    }
    
    // we add an action "delete" with a swap on the left
    // only cell with type TableEditedCellViewModel can be Edited
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableEditedCellViewModel else {
            return .none
        }
        
        if cellVM.canEdit {
                return .delete
            }
            else {
                return .none
            }
       }

}

