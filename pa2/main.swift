//
//  main.swift
//  Pa2
// This program is for running a full game of Uno
//  CPSC 315-01, Fall 2018
//  PA2
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

//can i make a card that models a blue 2

//var p1wins = false
//var p2wins = false
var player1 = Player()
var player2 = Player()
func main() {
    let uno = UnoGame()
    uno.buildHand()
    uno.turnLoop()
    
    //}
    
    
    //uno.printPlayers()
    
}
main()
//uno.printPlayers()
//print(getTop())

//print ("\(makeHand())")

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

