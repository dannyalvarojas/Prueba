//
//  HomeInteractor.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import UIKit

// MARK: - HomeInteractor
class HomeInteractor {
    
    func loadUser(completion:(@escaping (_ listPerson: [Person]) -> Void)) {
        LoaderActivity.shared.showActivity()
        FirebaseDataBase.sharedInstance.initDataBase()
        FirebaseDataBase.sharedInstance.getUsers(completion: { (success, list) -> Void in
            LoaderActivity.shared.removeActivity()
            if success {
                completion(list)
            }
        })
    }
    
}
