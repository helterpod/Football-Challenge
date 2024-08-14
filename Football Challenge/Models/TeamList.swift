//
//  TeamList.swift
//  Football Challenge
//
//  Created by Adrian Richard Talbot on 11/08/2024.
//

import Foundation

struct Filters : Decodable {
    var limit: Int?
    var offset: Int?
    var permission: String?
}

struct TeamList : Decodable {
    var count: Int?
    var filters: Filters = Filters()
    var teams: [Team] = [Team]()
}

