//
//  UnoGame.swift
//  pa2
//  This program is used to run the main game loop and holds all helper functions
//  CPSC 315-01, Fall 2018
//  PA2
//
//  Created by Walker, Charles Milton on 9/24/20.
//  Copyright © 2020 Walker, Charles Milton. All rights reserved.
//

import Foundation

class UnoGame {
    //returns card of game
    func getTop() -> Card {
        return deck.setTop()
    }
    
    func updateHandSizeP1() {
        player1.hand.updateNumCards()
    }
    func updateHandSizeP2() {
        player2.hand.updateNumCards()
    }
    //randomly selects player to go first
    func goFirst() -> String {
        var array = [1,2]
        array.shuffle()
        let num = array.removeFirst()
        player1.num = 1
        player2.num = 2
        if num == 1 {
            return "player1"
        }
        else {
            return "player2"
        }
    }
    //returns first card in drawPile and removes it from drawPile
    func drawCard() -> Card {
        deck.updateDrawPile()
    }
    
    //initial hands for both players
    func buildHand() {
        var i = 1
        while i <= 7{
            let card = drawCard()
            player1.hand.Cards.append(card)
            i += 1
        }
        updateHandSizeP1()
        var j = 1
        while j <= 7{
            let card = drawCard()
            player2.hand.Cards.append(card)
            j += 1
        }
        updateHandSizeP2()
    }
    
    /*func printPlayers() {
        deck.checkSize()
        print(player1)
        print(player2)
        deck.checkSize()
    }*/
    
    //places top card of drawpile into player1 hand
    func grabDrawCardP1() -> Card {
        let card = drawCard()
        player1.hand.Cards.insert(card, at: 0)
        updateHandSizeP1()
        //print(player1)
        return card
    }
    
    //places top card of drawpile into player2 hand
    func grabDrawCardP2() -> Card {
        let card = drawCard()
        player2.hand.Cards.insert(card, at: 0)
        updateHandSizeP2()
        return card
    }
    
    //places player card into discardpile
    func playCardP1(card: Card, num: Int) {
        print("Playing: \(card)")
        player1.hand.Cards.remove(at: num)
        updateHandSizeP1()
        deck.updateDiscardPile(card: card)
        return
    }
    
    func playCardP2(card: Card, num: Int) {
        print("Playing: \(card)")
        player2.hand.Cards.remove(at: num)
        updateHandSizeP2()
        deck.updateDiscardPile(card: card)
        return
    }
    //player 1's turn
    func player1Turn() {
        let curCard = getTop()
        print("**Your turn**")
        print("Current Card:", curCard)
        print(player1)
        var card: Card
        print("Please enter the 0-based index of the card you wish to play: ")
        print("(Or type '-1' to draw a new card)")
        let input = Int(readLine(strippingNewline: true)!)!
        //print(player1.hand.numCards)
        if input == -1 {
            card = grabDrawCardP1()
            if card.name == curCard.name || card.color == curCard.color {
                playCardP1(card: card, num: 0)
                if card.name == "Skip" {
                    player1Turn()
                }
                if card.name == "Draw+2" {
                    grabDrawCardP2()
                    grabDrawCardP2()
                }
                return
            }
        }
        else if input <= player1.hand.numCards {
            card = player1.hand.Cards[input]
            if card.name == curCard.name || card.color == curCard.color {
                playCardP1(card: card, num: input)
                if card.name == "Skip" {
                    player1Turn()
                }
                if card.name == "Draw+2" {
                    grabDrawCardP2()
                    grabDrawCardP2()
                }
                return
            }
        }
        else {
        print("Invalid input, please try again")
        player1Turn()
        }
    }
    
    //player2's turn
    func player2Turn() {
        let curCard = getTop()
        print("**Player 2's turn**")
        print("Current Card:", curCard)
        print(player2)
        var card: Card
        print(player2.hand.numCards)
        for i in 0..<player2.hand.numCards {
            card = player2.hand.Cards[i]
            if card.name == curCard.name || card.color == curCard.color {
                playCardP2(card: card, num: i)
                if card.name == "Skip" {
                    player2Turn()
                }
                if card.name == "Draw+2" {
                    grabDrawCardP1()
                    grabDrawCardP1()
                }
                return
            }
            continue
        }
        card = grabDrawCardP2()
        if card.name == curCard.name || card.color == curCard.color {

            print("drew")
            playCardP2(card: card, num: 0)
            if card.name == "Skip" {
                player2Turn()
            }
            if card.name == "Draw+2" {
                grabDrawCardP1()
                grabDrawCardP1()
            }
        }
        print("skipped")
        return
    }
    
    //main game loop
    func turnLoop() {
        let curCard = getTop()
        let firstP = goFirst()
        var p1wins = false
        var p2wins = false
        if firstP == "player1" {
            print("Player 1 (user) is going first")
            print("Current card: ", curCard)
            while p1wins == false && p2wins == false {
                player1Turn()
                if player1.hand.numCards == 0 {
                    p1wins = true
                }
                player2Turn()
                if player2.hand.numCards == 0 {
                    p2wins = true
                }
            }
        }
        if firstP == "player2" {
            print("Player 2 is going first")
            print("Current card: ", curCard)
            while p1wins == false && p2wins == false {
                player2Turn()
                if player2.hand.numCards == 0 {
                    p2wins = true
                }
                player1Turn()
                if player1.hand.numCards == 0 {
                    p1wins = true
                }
            }
        }
        if p1wins {
            print("You Win!")
            return
        }
        if p2wins {
            print("Player 2 Wins")
            return
        }
        
        return
    }
}
