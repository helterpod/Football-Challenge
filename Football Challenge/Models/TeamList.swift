//
//  TeamList.swift
//  Football Challenge
//
//  Created by Adrian Richard Talbot on 11/08/2024.
//

import Foundation

struct TeamList : Decodable {
    var count: Int?
    struct filters {
        var limit: Int?
        var offset: Int?
        var permission: String?
    }
    var teams: [Team] = [Team]()
}

