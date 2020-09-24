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

//
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

struct Hand: CustomStringConvertible {
    var Cards: [Card] = []
    var numCards: Int
    var description: String {
        return "\(Cards)"
    }
    var secretDescript: String {
        let secretCards = [String] (repeating: "card", count: Cards.count)
        return "\(secretCards)"
    }
}

struct Player: CustomStringConvertible {
    var num: Int
    var hand: Hand
    var description: String {
        return "Player\(num) : \(hand)"
    }
}

struct Deck: CustomStringConvertible {
    var drawPile: [Card] = []
    var discardPile: [Card] = []
    var description: String {
        let topCard = discardPile.last
        return "\(topCard)"
    }
}

func buildDeck () -> [Card] {
    
}
class UnoGame {
    
}

let card = Card(name: "2", color: "blue")
let card2 =  Card(name: "3", color: "green")
let hand = Hand(Cards: [card, card2], numCards: 2)
let player1 = Player(num: 1, hand: hand)
let deck = Deck(drawPile: [card,card2], discardPile: [card,card2])
print("how i see it:", card)
print("how they see it:", card.secretDescription)
//print(hand)
//print(hand.secretDescript)
print(player1)
print(deck)
