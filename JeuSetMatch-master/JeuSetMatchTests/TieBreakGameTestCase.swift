//
//  TieBreakGameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Steve Bernard on 20/11/2019.
//  Copyright © 2019 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class TieBreakGameTestCase: XCTestCase {
    var tieBreakGame: TieBreakGame!

    override func setUp() {
        super.setUp()
        tieBreakGame = TieBreakGame()
    }

    // Score doit passer de 0 à 1 (TieBreak)
    func testGivenScoreIs0_WhenIncrementingScore_ThenScoreIs1() {
        tieBreakGame.incrementScore(forPlayer: .one)

        XCTAssertEqual(tieBreakGame.scores[.one], 1)
    }

    // Qd le score atteint la valeur 7 le jeu doit se terminer.
    func testGivenScoreIs6_WhenIncrementingScore_ThenScoreIs7AndGameIsOver() {
        tieBreakGame.scores[.one] = 6

        tieBreakGame.incrementScore(forPlayer: .one)

        XCTAssertEqual(tieBreakGame.scores[.one], 7)
        XCTAssertTrue(tieBreakGame.isOver)

    }

    // Test des 2 points d'ecart.
    func testGivenScoreIs6To6_WhenIncrementingScore_ThenScoreIs7To6AndGameIsNotOver() {
        tieBreakGame.scores[.one] = 6
        tieBreakGame.scores[.two] = 6

        tieBreakGame.incrementScore(forPlayer: .one)

        XCTAssertEqual(tieBreakGame.scores[.one], 7)
        XCTAssertEqual(tieBreakGame.scores[.two], 6)
        XCTAssertFalse(tieBreakGame.isOver)

}
}
