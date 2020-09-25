//
//  Player.swift
//  pa2
// This program is used to build the player
//  CPSC 315-01, Fall 2018
//  PA2
//  Created by Walker, Charles Milton on 9/24/20.
//  Copyright © 2020 Walker, Charles Milton. All rights reserved.
//

import Foundation

struct Player: CustomStringConvertible {
    var num: Int
    var hand: Hand
    var description: String {
        if num == 2 {
            return "Player2: \(hand.secretDescription)"
        }
        return "Player1 : \(hand)"
    }
   
    init() {
        num = 1
        hand = Hand()
    }
    mutating func updateHand(num: Int) -> Card {
        hand.Cards.remove(at: num)
    }
}


