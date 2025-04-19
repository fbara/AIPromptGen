//
//  PromptViewModel.swift
//  AIPromptGen
//
//  Created by Frank Bara on 4/19/25.
//

import Foundation
import Combine

class PromptViewModel: ObservableObject {
    @Published var generatedPrompt: Prompt?
    @Published var savedPrompts: [Prompt] = []
    private let generatorService = PromptGeneratorService()
    private let storageService = StorageService()
    
    func generatePrompt(topic: String, category: PromptCategory, complexity: Prompt.Complexity, tone: Prompt.Tone) {
        let promptText = generatorService.generatePrompt(
            topic: topic,
            category: category,
            complexity: complexity,
            tone: tone
        )
        
        let prompt = Prompt(
            id: UUID(),
            text: promptText,
            category: category,
            complexity: complexity,
            tone: tone,
            createdAt: Date()
        )
        
        generatedPrompt = prompt
    }
    
    func savePrompt(_ prompt: Prompt) {
        storageService.savePrompt(prompt)
        loadSavedPrompts()
    }
    
    func loadSavedPrompts() {
        savedPrompts = storageService.loadPrompts()
    }
    
    func deletePrompts(at offsets: IndexSet) {
        savedPrompts.remove(atOffsets: offsets)
        storageService.savePrompts(savedPrompts)
    }
    
    func submitFeedback(for prompt: Prompt, rating: Int, comment: String?) {
        let feedback = Feedback(
            id: UUID(),
            promptId: prompt.id,
            rating: rating,
            comment: comment,
            createdAt: Date()
        )
        storageService.saveFeedback(feedback)
        // In a real app, this would also update the generator service
    }
}
