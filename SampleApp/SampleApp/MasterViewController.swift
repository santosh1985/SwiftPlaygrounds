//
//  MasterViewController.swift
//  SampleApp

import UIKit

class MasterViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    // MARK: - Properties
    var detailViewController: DetailViewController? = nil
    var allData = [JSONData]()
    var filteredData = [JSONData]()
    let searchController = UISearchController.init(searchResultsController: nil)
    
    var selectedCellImage: UIImage?
    let cache = CachedImage()
    
    override var prefersStatusBarHidden: Bool {
        return true
    } 
    
    // MARK: - View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.delegate = self
        
        DispatchQueue.main.async {
            self.readJSONData()
        }
        
        tableView.register(UINib.init(nibName: "SampleTableViewCell", bundle: nil), forCellReuseIdentifier: "SampleTableViewCell")
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = 44
        
        clearsSelectionOnViewWillAppear = false
        
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    fileprivate func readJSONData() {
        if let path = Bundle.main.path(forResource: "SampleJSON", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:String]]
                    if let results = jsonResult, results.count > 0 {
                        for dict in results {
                            if let name = dict["name"], let image = dict["image"] {
                                allData.append(JSONData(imageURL: image, name: name))
                            }
                        }
                        if allData.count > 0 {
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                } catch {}
            } catch {}
        }
        
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredData = allData.filter { data in
            return  data.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        searchController.resignFirstResponder()
        super.viewWillAppear(animated)
    }
    
    // MARK: - Table View
    
    fileprivate func cellImage(cell: SampleTableViewCell, data: JSONData) {
        cell.cellLabel.text = data.name
        if let image = cache.object(forKey: data.imageURL as AnyObject) as? UIImage {
            cell.cellImageView.image = image
        }else{
            DispatchQueue.main.async {
//                cell.showActivityIndicator()
                cell.cellImageView.imageFromUrl(urlString: data.imageURL, completion: { (done, image) in
                    if done {
//                        cell.hideActivityIndicator()
                        self.cache.setObject(image!, forKey: data.imageURL as AnyObject)
                    }
                })
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredData.count
        }
        return allData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath) as! SampleTableViewCell
        let data: JSONData
        if searchController.isActive && searchController.searchBar.text != "" {
            data = filteredData[indexPath.row]
        }else{
            data = allData[indexPath.row]
        }
        
        cellImage(cell: cell, data: data)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? SampleTableViewCell {
            if let image = cell.cellImageView.image {
                selectedCellImage = image
                performSegue(withIdentifier: "showDetail", sender: self)
            }
        }
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let data: JSONData
                if searchController.isActive && searchController.searchBar.text != "" {
                    data = filteredData[indexPath.row]
                }else{
                    data = allData[indexPath.row]
                }
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.cellData = (data.name, selectedCellImage!)
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
}

