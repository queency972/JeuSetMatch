//
//  MatchTestCase.swift
//  JeuSetMatchUITests
//
//  Created by Steve Bernard on 19/11/2019.
//  Copyright © 2019 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class MatchTestCase: XCTestCase {
    // MARK: - Properties
    var match: Match!

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        match = Match()
    }

    // MARK: - Helpers

    private func createSet(wonByPlayer player: Player) -> JeuSetMatch.Set {
        let set = Set()
        createManyGames(6, wonByPlayer: player, inSet: set)
        return set
    }

    private func createManyGames(_ count: Int, wonByPlayer player: Player, inSet set: JeuSetMatch.Set) {
        for _ in 1...count {
            let game = Game()
            game.winner = player
            set.games.append(game)
        }
    }

    private func createManySets(_ count: Int, wonByPlayer player: Player) {
        for _ in 1...count {
            let set = createSet(wonByPlayer: player)
            match.sets.append(set)
        }
    }

    // MARK: - Tests
    func testGivenPlayerOneHasWonThreeSets_WhenGettingWinner_ThenWinnerShouldBePlayerOneAndGameIsOver() {
        createManySets(3, wonByPlayer: .one)

        XCTAssertEqual(match.winner, .one)
        XCTAssertEqual(match.isOver, true)
    }
    
    func testGivenCurrentGameScoreIsNull_WhenPointIsAdded_ScoreIsOnlyIncremented() {
        match.pointEnded(wonBy: .one)

        XCTAssertEqual(match.sets.count, 1)
        XCTAssertEqual(match.sets.last!.games.count, 1)
        XCTAssertEqual(match.currentGame.scores[.one]!, 15)
    }

    func testGivenCurrentGameScoreIsForty_WhenPointIsAdded_GameIsEndedAndNewGameIsCreated() {
        match.currentGame.scores[.one] = 40
        match.pointEnded(wonBy: .one)

        XCTAssertTrue(match.sets.last!.games.first!.isOver)
        XCTAssertEqual(match.sets.last?.games.count, 2)
    }

    func testGivenCurrentGameScoreIsFortyAndSetScoreIs5_WhenPointIsAdded_SetIsEndedAndNewSetIsCreated() {
        createManyGames(5, wonByPlayer: .one, inSet: match.sets.last!)
        match.sets.last?.games.append(Game())
        match.currentGame.scores[.one] = 40

        match.pointEnded(wonBy: .one)

        XCTAssertTrue(match.sets.first!.games.last!.isOver)
        XCTAssertEqual(match.sets.count, 2)
    }
}
