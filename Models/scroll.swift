// scroll.swift
// apDash
//
// Created by ck on 11/10/24.

import SwiftUI

// Define the QuestionScroller as a SwiftUI View
struct QuestionScroller: View {
    @StateObject private var viewModel = QuestionViewModel()
    @State private var dragOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.questions) { question in
                    QuestionView(question: question)
                        .frame(height: geometry.size.height)
                        .padding(.horizontal, 40.0)
                }
            }
            .frame(height: geometry.size.height)
        }
    }
}
