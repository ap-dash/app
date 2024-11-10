//
//  types.swift
//  apDash
//
//  Created by ck on 11/10/24.
//

import Foundation

struct Question: Identifiable, Decodable {
    var id: Int
    var question: String
    var options: [String]
    var answer: String
}

class QuestionViewModel: ObservableObject {
    @Published var questions: [Question] = []
    
    init() {
        loadQuestions()
    }
    
    func loadQuestions() {
        if let url = Bundle.main.url(forResource: "questions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                questions = try JSONDecoder().decode([Question].self, from: data)
            } catch {
                print("Error loading or decoding questions: \(error)")
            }
        } else {
            print("JSON file not found")
        }
    }
}
