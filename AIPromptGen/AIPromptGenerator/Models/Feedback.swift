//
//  Feedback.swift
//  AIPromptGen
//
//  Created by Frank Bara on 4/19/25.
//

import Foundation

struct Feedback: Identifiable, Codable {
    let id: UUID
    let promptId: UUID
    let rating: Int // 1-5
    let comment: String?
    let createdAt: Date
}
