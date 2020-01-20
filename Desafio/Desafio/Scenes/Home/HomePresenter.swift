//
//  HomePresenter.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit
// MARK: - Class
class HomePresenter {
    
    var routing: DesafioRouter!
    var interactor: HomeInteractor!
    
    func loadUsers(completion:(@escaping(_ listUser: [Person]) -> Void)){
        interactor.loadUser(completion: { (list) in
            completion(list)
        })
    }
    
    func goToAddPerson() {
        routing.goToAddPerson()
    }
    
    func goToListPersons() {
        routing.goToListPersons()
    }
    
}

