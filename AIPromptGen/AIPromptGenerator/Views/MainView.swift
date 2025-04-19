//
//  MainView.swift
//  AIPromptGen
//
//  Created by Frank Bara on 4/19/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink("Generate Prompt") {
                    PromptGenerationView()
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("Saved Prompts") {
                    SavedPromptsView()
                }
                .buttonStyle(.bordered)
                
                NavigationLink("Learn About Prompts") {
                    EducationalResourcesView()
                }
                .buttonStyle(.bordered)
                
                Spacer()
            }
            .padding()
            .navigationTitle("AI Prompt Generator")
        }
    }
}

#Preview {
    ContentView()
}
