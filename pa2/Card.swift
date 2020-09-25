//
//  Card.swift
//  pa2
// This program is used to initiate card types
//  CPSC 315-01, Fall 2018
//  PA2
//  Created by Walker, Charles Milton on 9/24/20.
//  Copyright © 2020 Walker, Charles Milton. All rights reserved.
//

import Foundation
struct Card: CustomStringConvertible {
    var name: String
    var color: String
    var description: String {
        return "\(name)\(color)"
    }
    
    var secretDescription: String {
        return "card"
    }
}

enum Color: String {
    case 🔵 = "🔵"
    case 🟢 = "🟢"
    case 🟡 = "🟡"
    case 🔴 = "🔴"
}
extension Color{
    static let allCases: [Color] = [.🔵, .🟢, .🟡, .🔴]
}
