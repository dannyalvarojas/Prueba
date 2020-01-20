//
//  AddPersonInteractor.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import Foundation

class AddPersonInteractor {
    
    func savePerson(person:Person, completion:(@escaping(_ success:Bool) -> Void)) {
        LoaderActivity.shared.showActivity()
        FirebaseDataBase.sharedInstance.initDataBase()
        FirebaseDataBase.sharedInstance.addUser(user: person, completion: { (success) -> Void in
            LoaderActivity.shared.removeActivity()
            completion(success)
        })
    }
}


