//
//  AddPersonPresenter.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import Foundation
import UIKit

class AddPersonPresenter {
    
    var routing: DesafioRouter!
    var interactor: AddPersonInteractor!
    
    init (interactor: AddPersonInteractor) {
        self.interactor = interactor
    }
    
    func savePerson(person:Person) {
        interactor.savePerson(person: person, completion: { (success) in
            UIApplication.topViewController()?.navigationController?.popViewController(animated: true)
        })
    }

}
