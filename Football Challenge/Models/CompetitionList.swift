//
//  CompetitionList.swift
//  Football Challenge
//
//  Created by Adrian Talbot on 14/08/2024.
//

import Foundation

struct CompetitionList : Decodable {
    var count: Int?
    var filters: Filters?
    var competitions: [Competition] = [Competition]()
}
