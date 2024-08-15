//
//  Competition.swift
//  Football Challenge
//
//  Created by Adrian Talbot on 14/08/2024.
//

import Foundation


struct Competition: Identifiable, Decodable {
    var id: Int?
    var area: Area?
    var name: String?
    var code: String?
    var type: String?
    var emblem: String?
    var numberOfAvailableSeasons: Int?
}


struct Area : Identifiable, Decodable {
    var id: Int?
    var name: String?
    var code: String?
    var flag: String?
}

struct CurrentSeason : Identifiable, Decodable {
    var id: Int?
    var startDate: String?
    var endDate: String?
    var currentMatchDay: Int?
    var winner: Int?
}
