//
//  ListPersonPresenter.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import Foundation

class ListPersonPersenter {
    var routing: DesafioRouter!
    var interactor: ListPersonInteractor!
    
    func loadPeaple(completion:(@escaping(_ people:People) -> Void)) {
        interactor.people(completion: { people in
            completion(people!)
        })
    }
    
    func searchPerson(name: String, list: [results]) -> [results] {
        return interactor.filtered(name: name, list: list)
    }
    
    func goToDetail(people: results) {
        routing.goToDetailPeople(people: people)
    }
}
