//
//  Deck.swift
//  pa2
// This program is used to build the Deck
//  CPSC 315-01, Fall 2018
//  PA2
//  Created by Walker, Charles Milton on 9/24/20.
//  Copyright © 2020 Walker, Charles Milton. All rights reserved.
//

import Foundation

struct Deck: CustomStringConvertible {
    var drawPile: [Card] = []
    var discardPile: [Card] = []
    var description: String {
        let topCard = discardPile.first
        return "\(topCard ?? Card(name: "null", color:"🔵"))"
    }
    init(){
        var card: Card
        //Deck.init(drawPile: <#T##[Card]#>, discardPile: <#T##[Card]#>)
        for j in Color.allCases {
            for i in 0...9 {
                card = Card(name: "\(i)", color:"\(j)")
                drawPile.append(card)
            }
        }
        for j in Color.allCases {
            for i in 1...9 {
                card = Card(name: "\(i)", color:"\(j)")
                drawPile.append(card)
            }
        }
        for i in Color.allCases {
            card = Card(name: "Skip", color: "\(i)")
            drawPile.append(card)
            drawPile.append(card)
            card = Card(name: "Draw+2", color: "\(i)")
            drawPile.append(card)
            drawPile.append(card)
            card = Card(name: "Wild", color: "\(i)")
            drawPile.append(card)
        }
        drawPile.shuffle()
        let firstCard = drawPile.removeFirst()
        discardPile.append(firstCard)
        return
    }
    
    func setTop() -> Card {
        return discardPile.first!
    }
    
    mutating func updateDrawPile() -> Card {
        drawPile.removeFirst()
    }
    
    mutating func updateDiscardPile(card: Card) {
        discardPile.insert(card, at: 0)
    }
    /*mutating func checkSize() {
        print(drawPile.count)
    }*/
}
var deck = Deck()


