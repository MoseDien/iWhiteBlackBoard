//
//  ReplayView.swift
//  iWhiteBlackBoard
//
//  Created by Bell on 2024/11/29.
//
import SwiftUI

private let cellSize: Double = 40
private let pieceSize: Double = 30
struct ReplayView: View {
    @StateObject private var viewModel: ReplayViewModel
    
    init(size: Int, moves: [ChessMove]) {
        _viewModel = StateObject(wrappedValue: ReplayViewModel(size: size, moves: moves))
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                ForEach(0..<viewModel.size, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<viewModel.size, id: \.self) { col in
                            ZStack {
                                // Grid
                                Rectangle()
                                    .fill((row + col).isMultiple(of: 2) ? Color.gray : Color.gray)
                                    .frame(width: cellSize, height: cellSize)
                                    .border(Color.black, width: 1)
                                
                                // pieces
                                if viewModel.board[row][col] == 1 {
                                    Circle()
                                        .fill(Color.black)
                                        .frame(width: pieceSize, height: pieceSize)
                                } else if viewModel.board[row][col] == 2 {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: pieceSize, height: pieceSize)
                                }
                            }
                        }
                    }
                }
            }
            .border(Color.black, width: 2)
            
            HStack {
                Button("重置") {
                    viewModel.reset()
                }
                .padding()
                
                Button("下一步") {
                    viewModel.nextMove()
                }
                .padding()
            }
            
            Text("当前步数: \(viewModel.currentStep) / \(viewModel.moves.count)")
                .font(.headline)
                .padding()
        }
        .padding()
    }
}
