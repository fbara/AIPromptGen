//
//  PromptGenerationView.swift
//  AIPromptGen
//
//  Created by Frank Bara on 4/19/25.
//

import SwiftUI

struct PromptGenerationView: View {
    @StateObject private var viewModel = PromptViewModel()
    @State private var topic = ""
    @State private var selectedCategory = PromptCategory.creativeWriting
    @State private var selectedComplexity = Prompt.Complexity.simple
    @State private var selectedTone = Prompt.Tone.casual
    
    var body: some View {
        Form {
            Section(header: Text("Prompt Details")) {
                TextField("Enter topic or theme", text: $topic)
                
                Picker("Category", selection: $selectedCategory) {
                    ForEach(PromptCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                
                Picker("Complexity", selection: $selectedComplexity) {
                    ForEach(Prompt.Complexity.allCases, id: \.self) { complexity in
                        Text(complexity.rawValue.capitalized).tag(complexity)
                    }
                }
                
                Picker("Tone", selection: $selectedTone) {
                    ForEach(Prompt.Tone.allCases, id: \.self) { tone in
                        Text(tone.rawValue.capitalized).tag(tone)
                    }
                }
            }
            
            Section {
                Button("Generate Prompt") {
                    viewModel.generatePrompt(
                        topic: topic,
                        category: selectedCategory,
                        complexity: selectedComplexity,
                        tone: selectedTone
                    )
                }
                .disabled(topic.isEmpty)
            }
        }
        .navigationTitle("Generate Prompt")
        .sheet(item: $viewModel.generatedPrompt) { prompt in
            ResultsView(prompt: prompt, viewModel: viewModel)
        }
    }
}
