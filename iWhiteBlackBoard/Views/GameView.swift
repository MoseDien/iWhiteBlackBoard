//
//  GameView.swift
//  iWhiteBlackBoard
//
//  Created by Bell on 2024/11/29.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        let moves: [ChessMove] = [
            ChessMove(row: 3, col: 3, player: 1),
            ChessMove(row: 3, col: 4, player: 2),
            ChessMove(row: 4, col: 4, player: 1),
            ChessMove(row: 4, col: 3, player: 2),
            ChessMove(row: 5, col: 3, player: 1),
            ChessMove(row: 5, col: 4, player: 2),
            ChessMove(row: 3, col: 5, player: 1),
            ChessMove(row: 6, col: 2, player: 2),
            ChessMove(row: 5, col: 5, player: 1),
        ]
        
        return ReplayView(size: 8, moves: moves)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
