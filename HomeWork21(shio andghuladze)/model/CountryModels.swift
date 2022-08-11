//
//  CountryModels.swift
//  HomeWork21(shio andghuladze)
//
//  Created by shio andghuladze on 11.08.22.
//

import Foundation

struct Country: Codable{
    let capital: String?
    let name: String
    let flags: Flag
}

struct Flag: Codable{
    let png: String
}
