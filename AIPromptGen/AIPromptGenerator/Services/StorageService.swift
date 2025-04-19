//
//  StorageService.swift
//  AIPromptGen
//
//  Created by Frank Bara on 4/19/25.
//

import Foundation

class StorageService {
    private let promptsFile = "prompts.json"
    private let feedbackFile = "feedback.json"
    
    func savePrompt(_ prompt: Prompt) {
        var prompts = loadPrompts()
        prompts.append(prompt)
        savePrompts(prompts)
    }
    
    func savePrompts(_ prompts: [Prompt]) {
        do {
            let data = try JSONEncoder().encode(prompts)
            try data.write(to: getDocumentsDirectory().appendingPathComponent(promptsFile))
        } catch {
            print("Error saving prompts: \(error)")
        }
    }
    
    func loadPrompts() -> [Prompt] {
        do {
            let data = try Data(contentsOf: getDocumentsDirectory().appendingPathComponent(promptsFile))
            return try JSONDecoder().decode([Prompt].self, from: data)
        } catch {
            return []
        }
    }
    
    func saveFeedback(_ feedback: Feedback) {
        var feedbacks = loadFeedback()
        feedbacks.append(feedback)
        do {
            let data = try JSONEncoder().encode(feedbacks)
            try data.write(to: getDocumentsDirectory().appendingPathComponent(feedbackFile))
        } catch {
            print("Error saving feedback: \(error)")
        }
    }
    
    func loadFeedback() -> [Feedback] {
        do {
            let data = try Data(contentsOf: getDocumentsDirectory().appendingPathComponent(feedbackFile))
            return try JSONDecoder().decode([Feedback].self, from: data)
        } catch {
            return []
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
