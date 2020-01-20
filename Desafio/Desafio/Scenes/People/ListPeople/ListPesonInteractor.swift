//
//  ListPesonInteractor.swift
//  Desafio
//
//  Created by Danny Alva on 1/18/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import Foundation
import Alamofire

class ListPersonInteractor {
    
    func people(completion:(@escaping(_ peaple:People?)->Void)) {
        LoaderActivity.shared.showActivity()
        AF.request("https://swapi.co/api/people/", method: .get, parameters: [:], encoding: URLEncoding.queryString, headers: nil, interceptor: nil).responseJSON {response in
            LoaderActivity.shared.removeActivity()
            debugPrint(response)
            do {
                let data = response.data!
                let decoder = JSONDecoder()
                let people = try decoder.decode(People.self, from: data)
                completion(people)
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
    func filtered(name:String, list:[results]) -> [results] {
        let listFiltered = list.filter { $0.name?.contains("\(name)") ?? false }
        return listFiltered
    }
    
}
