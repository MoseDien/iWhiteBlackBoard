//
//  ReplayViewModel.swift
//  iWhiteBlackBoard
//
//  Created by Bell on 2024/11/29.
//
import Combine

class ReplayViewModel: ObservableObject {
    @Published var board: [[Int]]
    @Published var currentStep: Int = 0
    let moves: [ChessMove]
    let size: Int
    
    init(size: Int, moves: [ChessMove]) {
        self.size = size
        self.moves = moves
        self.board = Array(repeating: Array(repeating: 0, count: size), count: size)
    }
    
    func nextMove() {
        guard currentStep < moves.count else { return }
        let move = moves[currentStep]
        board[move.row][move.col] = move.player
        currentStep += 1
    }
    
    func reset() {
        board = Array(repeating: Array(repeating: 0, count: size), count: size)
        currentStep = 0
    }
}
