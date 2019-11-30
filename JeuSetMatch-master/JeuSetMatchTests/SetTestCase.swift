//
//  SetTestCase.swift
//  JeuSetMatchUITests
//
//  Created by Steve Bernard on 19/11/2019.
//  Copyright © 2019 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class SetTestCase: XCTestCase {
    var set = Set()

    override func setUp() {
        super.setUp()
        set = Set()
    }

    func createManyGames(_ count: Int, wonByPlayer player: Player) {
        for _ in 1...count {
            let game = Game()
            game.winner = player
            set.games.append(game)
        }
    }

    func testGivenPlayerWinsByThreeGamesToTwo_WhenGettingScoreFromSet_ThenScoreShouldBeThreeToTwo() {
        createManyGames(2, wonByPlayer: .one)
        createManyGames(3, wonByPlayer: .two)

        XCTAssertEqual(set.scores[.one], 2)
        XCTAssertEqual(set.scores[.two], 3)
    }

    func testGivenSetIsNotOver_WhenGettingWinner_ThenWinnerShouldBeNil() {
        XCTAssertNil(set.winner)
    }

    func testGivenPlayerOneHasWonSixGames_WhenGettingWinner_ThenWinnerShouldBePlayerOne() {
        createManyGames(6, wonByPlayer: .one)

        XCTAssertEqual(set.winner, .one)
        XCTAssertEqual(set.isOver, true)
    }

     // Lorsque le jeu est à 6 - 5, le set n'est pas terminé. 
    func testGivenScoreIs6to5_WhenGettingWinner_ThenWinnerAndSetIsNotOver() {
        createManyGames(6, wonByPlayer: .one)
        createManyGames(5, wonByPlayer: .two)

        XCTAssertNil(set.winner)
        XCTAssertFalse(set.isOver)

    }

    func testGivenScoreIs7To6_WhenGettingWinner_ThenPlayer1IsWinner() {
        createManyGames(7, wonByPlayer: .one)
        createManyGames(6, wonByPlayer: .two)

        XCTAssertEqual(set.winner, .one)
        XCTAssertTrue(set.isOver)

}
}
