//
//  People.swift
//  Desafio
//
//  Created by Danny Alva on 1/19/20.
//  Copyright © 2020 Danny Alva. All rights reserved.
//

import Foundation

struct  People: Codable {
    let count: Int?
    let results:[results]?
}

struct results:Codable {
    let name: String?
    let height: String?
    let mass: String?
    let hair_color: String?
    let skin_color: String?
    let birth_year: String?
    let gender: String?
}
