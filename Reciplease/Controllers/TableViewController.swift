//
//  TableViewController.swift
//  Reciplease
//
//  Created by David-IOS on 19/10/2021.
//

import UIKit


class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ScrollableViewModel?
    
    init(viewModel: ScrollableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "TableViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        navigationItem.title = "Reciplease"
       }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 0.2160621881, green: 0.2001904547, blue: 0.196036458, alpha: 1)
        tableView.separatorColor = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        self.viewModel?.loadData {
            self.registerCells()
            self.tableView.reloadData()
        }
        
    }



    // MARK: - Register
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

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return UITableViewCell()
        }
        
        let reuseIdentifier = cellVM.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                 for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
      
        cell.configure(cellViewModel: cellVM,
                       from: self)
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
                        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellVM.reuseIdentifier)
        cell?.cellPressed(cellViewModel: cellVM,
                          from: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableCellViewModel else {
            return UITableView.automaticDimension
        }
        
        return CGFloat(cellVM.height)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let cellVM = self.viewModel?.item(at: indexPath) as? FavoriteCellViewModel else {
            return
        }
        
        if editingStyle == .delete {
            let context = AppDelegate.viewContext
            context.delete(cellVM.favorite)
            try? AppDelegate.viewContext.save()
            self.viewModel?.remove(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
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

