//
//  HomeViewController.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var userTable: UITableView!
    var userList: [Person] = []
    
    var presenter: HomePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.interactor = HomeInteractor()
        addRigthNavigationButton()
        addLeftnavigationButto()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadUsers()
    }
    
    // MARK: - Own Methods
    
    func addRigthNavigationButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(addUser))
        self.navigationItem.rightBarButtonItem  = addButton
    }
    
    func addLeftnavigationButto() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        button.setTitle("Personas", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(loadProfiles), for: .touchUpInside)
        let addButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem  = addButton
    }
    
    @objc func loadProfiles() {
        presenter.goToListPersons()
    }
    
    @objc func addUser () {
        presenter.goToAddPerson()
    }
    
    func loadUsers() {
        presenter.loadUsers(completion: { (list) in
            self.userList = list
            self.userTable.reloadData()
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

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UserCell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserCell
        cell.loadData(user: self.userList[indexPath.row])
        return cell
    }
}

/*extension HomeViewController: HomePresenterProtocol {
    func responseList(list: [Person]) {
        userList = list
        userTable.reloadData()
    }
}*/

// MARK: - StoryboardInstantiable
extension HomeViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return "Main"
    }
}
