//
//  ContentView.swift
//  GuessGame
//
//  Created by Luis Filipe Pedroso on 07/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var correctAnswer = 0
    @State private var gameTitle = "?"
    @State private var gameSubtitle = ""
    
    var gameSubtitleMap: [Int: String] = [
        0: "Correct answer is dog!",
        1: "Correct answer is cat!",
        2: "Correct answer is fox!"
    ]
    
    var body: some View {
        VStack(spacing: 100) {
            VStack {
                Text(gameTitle)
                    .font(.system(size: 40, weight: .semibold))
                    .padding(.top, 100)
                Text(gameSubtitle)
                    .font(.system(size: 20))
            }
            
            VStack {
                HStack {
                    Spacer()
                    Text("Score \(score)")
                        .font(.system(size: 15, weight: .semibold))
                }
                GuessButton(icon: "dog", action: {
                    checkAnswer(0)
                })
                GuessButton(icon: "cat", action: {
                    checkAnswer(1)
                })
                GuessButton(icon: "fox", action: {
                    checkAnswer(2)
                })
            }
            
            Spacer()
        }
        .padding()
    }
    
    func checkAnswer(_ answer: Int) {
        if answer == correctAnswer {
            score += 1
            gameTitle = "You nailed it ✅"
        } else {
            score = max(score - 1, 0)
            gameTitle = "Nope ❌"
        }
        
        gameSubtitle = gameSubtitleMap[correctAnswer] ?? ""
        randomizeCorrectAnswer()
    }
    
    func randomizeCorrectAnswer() {
        correctAnswer = Int.random(in: 0..<3)
    }
    
    @ViewBuilder
    private func GuessButton(icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action, label: {
           Image(icon)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        })
    }
}

#Preview {
    ContentView()
}
