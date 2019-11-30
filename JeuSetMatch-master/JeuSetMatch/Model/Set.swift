//
//  Set.swift
//  Jeu Set & Match
//
//  Created by Ambroise COLLON on 19/10/2017.
//  Copyright © 2017 OpenClassrooms. All rights reserved.
//

import Foundation

class Set {
    // MARK: - Properties
    var games = [Game()]

    var winner: Player? {
        return getWinner()
    }

    var isOver: Bool {
        return winner != nil
    }

    var scores: [Player: Int] {
        return getScores()
    }

    static let maxNumberOfWonGames = 6

    var shouldGoToTieBreak: Bool {
        return scores[.one] == Set.maxNumberOfWonGames && scores[.two] == Set.maxNumberOfWonGames
    }

    private var isTwoPointsAhead: Bool {
        return abs(scores[.one]! - scores[.two]!) >= 2
    }

    // MARK: - Private Getters
    private func getWinner() -> Player? {
        // Lors du parcours du dictionnaire score des 2 joueurs, on verifie s'il y a 2 points d'ecart.
        for (player, score) in scores where (score == Set.maxNumberOfWonGames && isTwoPointsAhead)
            // Exception si le joueur atteint 7.
            || score == Set.maxNumberOfWonGames + 1 {
                return player
            }
        return nil
    }

    private func getScores() -> [Player: Int] {
        var scores = [Player.one: 0, Player.two: 0]

        for game in games {
            if let gameWinner = game.winner {
                scores[gameWinner]! += 1
            }
        }
        return scores
    }
}
