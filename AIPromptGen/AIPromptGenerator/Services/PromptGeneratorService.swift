//
//  PromptGeneratorService.swift
//  AIPromptGen
//
//  Created by Frank Bara on 4/19/25.
//

import Foundation

class PromptGeneratorService {
    func generatePrompt(topic: String, category: PromptCategory, complexity: Prompt.Complexity, tone: Prompt.Tone) -> String {
        switch complexity {
        case .simple:
            return generateSimplePrompt(topic: topic, category: category, tone: tone)
        case .complex:
            return generateComplexPrompt(topic: topic, category: category, tone: tone)
        }
    }
    
    private func generateSimplePrompt(topic: String, category: PromptCategory, tone: Prompt.Tone) -> String {
        let prefix = tone == .formal ? "Please provide" : "Give me"
        switch category {
        case .creativeWriting:
            return "\(prefix) a list of 5 ideas for \(topic) stories."
        case .dataAnalysis:
            return "\(prefix) a summary of key trends in \(topic) data."
        case .problemSolving:
            return "\(prefix) 3 potential solutions for \(topic) challenges."
        }
    }
    
    private func generateComplexPrompt(topic: String, category: PromptCategory, tone: Prompt.Tone) -> String {
        let prefix = tone == .formal ? "Please create" : "Create"
        switch category {
        case .creativeWriting:
            return "\(prefix) a 500-word story about \(topic), incorporating three distinct settings and two main characters, using a \(tone.rawValue) tone."
        case .dataAnalysis:
            return "\(prefix) a detailed analysis of \(topic) data, including statistical measures, trends, and recommendations, presented in a \(tone.rawValue) style."
        case .problemSolving:
            return "\(prefix) a comprehensive strategy to address \(topic) issues, including risk assessment, implementation steps, and evaluation metrics, in a \(tone.rawValue) tone."
        }
    }
}
