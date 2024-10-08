//
//  Area.swift
//  Football Challenge
//
//  Created by Adrian Talbot on 17/08/2024.
//

import Foundation


struct Area : Identifiable, Decodable, Hashable {
    var id: Int?
    var name: String?
    var countryCode: String?
    var flag: String?
    var parentAreaId: Int?
    var parentArea: String?
}

struct AreaList : Decodable {
    var count: Int?
    var filters: Filters?
    var areas: [Area] = [Area]()
//    let isSelected: Bool = false    // Not returned from endpoint, used in GUI
}
