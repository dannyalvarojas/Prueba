//
//  ListPersonViewController.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit

class ListPersonViewController: UIViewController {
    
    @IBOutlet weak var peapleTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var people: People? = nil
    var isFilter: Bool = false
    var listFiltered: [results]? = []
    
    var presenter: ListPersonPersenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Own Methods
    func loadData() {
        presenter.loadPeaple(completion: { people in
            self.people = people
            self.peapleTable.reloadData()
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListPersonViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFilter {
            return listFiltered?.count ?? 0
        } else {
            return people?.results?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PeopleCell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell") as! PeopleCell
        if isFilter {
            cell.loadData(data: (listFiltered![indexPath.row]))
        } else {
            cell.loadData(data: (people?.results![indexPath.row])!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var people: results
        if isFilter {
            people = listFiltered![indexPath.row]
        } else {
            people = (self.people?.results![indexPath.row])!
        }
        presenter.goToDetail(people: people)
    }
}

extension ListPersonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            isFilter = false
        } else {
            isFilter = true
            listFiltered =  presenter.searchPerson(name: searchText, list: (people?.results!)!)
        }
        peapleTable.reloadData()
    }
}

extension ListPersonViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return "Main"
    }

}
