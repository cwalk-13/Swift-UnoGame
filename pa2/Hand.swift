//
//  Hand.swift
//  pa2
// This program is used to build the Hands
//  CPSC 315-01, Fall 2018
//  PA2
//  Created by Walker, Charles Milton on 9/24/20.
//  Copyright © 2020 Walker, Charles Milton. All rights reserved.
//

import Foundation
struct Hand: CustomStringConvertible {
    var Cards: [Card] = []
    var numCards: Int
    var description: String {
        return "\(Cards)"
    }
    var secretDescription: String {
        let secretCards = [String] (repeating: "🎴", count: Cards.count)
        return "\(secretCards)"
    }
    init() {
        numCards = Cards.count
      }
    
    mutating func updateHand(num: Int) -> Card {
        Cards.remove(at: num)
    }
    
    mutating func updateNumCards() {
        numCards = Cards.count
    }
}
