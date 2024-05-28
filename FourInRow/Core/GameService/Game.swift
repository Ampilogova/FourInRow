//
//  Game.swift
//  FourInRow
//
//  Created by Tatiana Ampilogova on 5/26/24.
//

import UIKit

struct Game {
    
    private(set) var field: [[FieldItem]]
    var currentPlayer = Player(id: 1)
    let rows = 6
    let columns = 7
    
    init() {
        self.field = Array(repeating: Array(repeating: FieldItem(id: 0), count: columns), count: rows)
    }
    
    mutating func makeTurn(column: Int, player: Int) -> Bool {
        for row in (0..<rows).reversed() {
            if field[row][column].id == 0 {
                field[row][column].id = player
                return true
            }
        }
        return false
    }
    
    func checkWin(player: Int) -> Bool {
        for row in 0..<rows {
            for column in 0..<columns {
                if checkDirection(row: row, column: column, dRow: 0, dColumn: 1, player: player) || //H
                    checkDirection(row: row, column: column, dRow: 1, dColumn: 0, player: player) || //V
                    checkDirection(row: row, column: column, dRow: 1, dColumn: 1, player: player) || // D r
                    checkDirection(row: row, column: column, dRow: 0, dColumn: -1, player: player) { // D l
                    return true
                }
            }
        }
        return false
    }
    
    func checkDirection(row: Int, column: Int, dRow: Int, dColumn: Int, player: Int) -> Bool {
        var count = 0
        var r = row
        var c = column
        for _ in 0..<4 {
            if r >= 0 && r < rows && c >= 0 && c < columns && field[r][c].id == player {
                count += 1
                r += dRow
                c += dColumn
            } else {
                break
            }
        }
        return count == 4
    }
    
    func changePlayer() -> String {
        if currentPlayer.id == 1 {
            return "Red Player"
        }
        return "Blue Player"
    }
}

