//
//  Team.swift
//  Football Challenge
//
//  Created by Adrian Richard Talbot on 11/08/2024.
//

import Foundation

struct Team : Identifiable, Decodable {
    var id: Int?
    var name: String?
    var shortName: String?
    var tla: String?
}
