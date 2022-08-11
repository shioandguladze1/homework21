//
//  FirstPageViewController.swift
//  HomeWork21(shio andghuladze)
//
//  Created by shio andghuladze on 11.08.22.
//

import UIKit

class FirstPageViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var countries = [Country]()
    private var searchedCountries = [Country]()
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
        
        NetworkClinet.getData(url: serverUrl, codableType: [Country].self){ r in
            if let successResult = r as? Success<[Country]>{
                DispatchQueue.main.async {
                    self.countries = successResult.data
                    self.searchedCountries = successResult.data
                    self.tableView.reloadData()
                }
            }
            
            print((r as? Error)?.errorMessage ?? "")
        }
        
        
    }

}

extension FirstPageViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as? CountryTableViewCell{
            cell.setUp(name: searchedCountries[indexPath.row].name)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "SecondPageViewController") as? SecondPageViewController{
            controller.country = searchedCountries[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.isEmpty) { searchedCountries = countries }
        else { searchedCountries = countries.filter{ $0.name.contains(searchText) } }
        tableView.reloadData()
        print(searchText)
    }
    
}
