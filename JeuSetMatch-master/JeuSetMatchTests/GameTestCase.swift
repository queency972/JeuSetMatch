//
//  GameTestCase.swift
//  JeuSetMatchUITests
//
//  Created by Steve Bernard on 19/11/2019.
//  Copyright © 2019 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class GameTestCase: XCTestCase {

    var game: Game!

    override func setUp() {
        super.setUp()
        game = Game()
    }

    func setPlayerOneScore(_ sender: Int) {
        game.scores[.one] = sender
    }

    func testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {

          //When
          game.incrementScore(forPlayer: .one)

          //Then
          XCTAssert(game.scores[.one]! == 15)
          XCTAssert(game.scores[.two]! == 0)
      }

    func testGivenScoreIsFifteen_WhenIncrementingPlayer1Score_ThenScoreShouldBeThirty() {
           // Given
          setPlayerOneScore(15)

           //When
           game.incrementScore(forPlayer: .one)

           //Then
           XCTAssert(game.scores[.one]! == 30)
           XCTAssert(game.scores[.two]! == 0)
       }

    func testGivenScoreIsThirty_WhenIncrementingPlayer1Score_ThenScoreShouldBeForty() {
        // Given
           setPlayerOneScore(30)

        //When
        game.incrementScore(forPlayer: .one)

        //Then
        XCTAssert(game.scores[.one]! == 40)
        XCTAssert(game.scores[.two]! == 0)
    }

    func testGivenScoreIsForty_WhenIncrementingPlayer1Score_ThenGameIsOverAndWonByPlayer1() {
        // Given
           setPlayerOneScore(40)

        //When
        game.incrementScore(forPlayer: .one)

        //Then
        XCTAssertEqual(game.winner, .one)
        XCTAssertTrue(game.isOver)
    }
}
