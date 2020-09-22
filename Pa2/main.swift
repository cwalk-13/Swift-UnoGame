//
//  main.swift
//  Pa2
//
//  Created by Walker, Charles Milton on 9/21/20.
//  Copyright © 2020 Walker, Charles Milton. All rights reserved.
//

import Foundation

print("Hello, World!")
//1. familiarize yourelf with the problem
//2. look for nouns
//3. identify the verbs in the problem
//  how do the nouns interact
//4. model nouns as types and model verbs as methods
// start with the fundamnetal unit of thr problem
struct Card: CustomStringConvertible {
    var name: String
    var color: String
    var description: String {
        return "\(color)\(name)\(color)"
    }
    
    var secretDescription: String {
        return "card"
    }
}

//can i make a card that models a blue 2
let card = Card(name: "2", color: "blue")
print("how i see it:", card)
print("how they see it:", card.secretDescription)
