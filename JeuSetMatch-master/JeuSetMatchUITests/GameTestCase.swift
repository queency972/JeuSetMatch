//
//  GameTestCase.swift
//  JeuSetMatchUITests
//
//  Created by Steve Bernard on 17/11/2019.
//  Copyright © 2019 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class GameTestCase: XCTestCase {
    func testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {
        // Given
        let game  = Game()

        //When
        game.incrementScore(forPlayer: .one)

        //Then
        XCTAssert(game.scores[.one]! == 15)
        XCTAssert(game.scores[.two]! == 0)
    }
}
