//
//  Prompt.swift
//  AIPromptGen
//
//  Created by Frank Bara on 4/19/25.
//

import Foundation

struct Prompt: Identifiable, Codable {
    let id: UUID
    let text: String
    let category: PromptCategory
    let complexity: Complexity
    let tone: Tone
    let createdAt: Date
    
    enum Complexity: String, Codable, CaseIterable {
        case simple, complex
    }
    
    enum Tone: String, Codable, CaseIterable {
        case formal, casual, instructional
    }
}
