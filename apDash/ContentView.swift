//
//  ContentView.swift
//  apDash
//
//  Created by ck on 11/9/24.
//

import SwiftUI
import Foundation

// Model for a single question

struct ContentView: View {
    @StateObject private var viewModel = QuestionViewModel()
    @State private var dragOffset: CGFloat = 0
    
    let letters = ["A", "B", "C", "D", "E"] // Array of letters for options
    
    var body: some View {
        GeometryReader { geometry in
            TabView {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(viewModel.questions) { question in
                        QuestionView(question: question)
                        .frame(height: geometry.size.height)
                        .padding(.horizontal, 40.0)
                        .scrollTargetLayout()
                    }
                }
                .scrollTargetBehavior(.paging)
                .frame(height: geometry.size.height)
                .tabItem{
                    Label("Questions", systemImage: "x.squareroot")
                }
                
                StatsView()
                    .tabItem{
                        Label("Your Stats", systemImage: "person.crop.circle.fill")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
