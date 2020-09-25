//
//  main.swift
//  Pa2
//
//  Created by Walker, Charles Milton on 9/21/20.
//  Copyright © 2020 Walker, Charles Milton. All rights reserved.
//
import Foundation


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
    init() {
        Cards = [Card(name: "1", color: "🔵")]
        numCards = Cards.count
    }
}

struct Player: CustomStringConvertible {
    var num: Int
    var hand: Hand
    var description: String {
        return "Player\(num) : \(hand)"
    }
    init() {
        num = 1
        hand = Hand()
    }
}

struct Deck: CustomStringConvertible {
    var drawPile: [Card] = []
    var discardPile: [Card] = []
    var description: String {
        let topCard = discardPile.first
        return "\(topCard)"
    }
}




//class UnoGame {
    var player1 = Player()
    var player2 = Player()
    func buildDeck () -> Deck {
        var card: Card
        var CardsArray: [Card] = []
        //Deck.init(drawPile: <#T##[Card]#>, discardPile: <#T##[Card]#>)
        for j in Color.allCases {
            for i in 0...9 {
                card = Card(name: "\(i)", color:"\(j)")
                CardsArray.append(card)
            }
        }
        for j in Color.allCases {
            for i in 1...9 {
                card = Card(name: "\(i)", color:"\(j)")
                CardsArray.append(card)
            }
        }
        for i in Color.allCases {
            card = Card(name: "Skip", color: "\(i)")
            CardsArray.append(card)
            CardsArray.append(card)
            card = Card(name: "Draw+2", color: "\(i)")
            CardsArray.append(card)
            CardsArray.append(card)
            card = Card(name: "Wild", color: "\(i)")
            CardsArray.append(card)
        }
        //print("\(CardsArray)")
        //print("\(CardsArray.count)")
        CardsArray.shuffle()
        let firstCard = CardsArray.removeFirst()
        Deck.init(drawPile: CardsArray, discardPile: [firstCard])
        var deck = Deck()
        return deck
    }
    
    func goFirst() -> Player {
        var array = [1,2]
        array.shuffle()
        let num = array.removeFirst()
        player1.num = 1
        player2.num = 2
        if num == 1 {
            return player1
        }
        else {
            return player2
        }
    }

    func makeHand() -> Player {
        //var deck: Deck = buildDeck()
        goFirst()
        //player2.hand
        for i in 0...7 {
            var card = buildDeck().drawPile.removeFirst()
            player1.hand.Cards.append(card)
        }
        print(player1)
        return player1
    }
print ("\(makeHand())")

//let card = Card(name: "2", color: "blue")
//let card2 =  Card(name: "3", color: "green")
//let hand = Hand(Cards: [card, card2], numCards: 2)
//let player1 = Player(num: 1, hand: hand)
//let deck = Deck(drawPile: [card,card2], discardPile: [card,card2])
//print("how i see it:", card)
//print("how they see it:", card.secretDescription)
//print(hand)
//print(hand.secretDescript)
//print(player1)
//print(deck)

