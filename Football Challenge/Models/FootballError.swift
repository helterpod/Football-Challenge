//
//  FootballError.swift
//  Football Challenge
//
//  Created by Adrian Talbot on 18/08/2024.
//

import Foundation

struct FootballError : Decodable {
    var message: String?
    var errorCode: Int?
}
