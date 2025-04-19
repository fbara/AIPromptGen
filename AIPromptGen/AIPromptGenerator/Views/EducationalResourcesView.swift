//
//  EducationalResourcesView.swift
//  AIPromptGen
//
//  Created by Frank Bara on 4/19/25.
//

import SwiftUI

struct EducationalResourcesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Writing Effective AI Prompts")
                    .font(.title2)
                    .bold()
                
                Text("Tips for Better Prompts")
                    .font(.headline)
                Text("""
                1. Be specific and clear in your instructions
                2. Provide context when necessary
                3. Use examples to guide the AI
                4. Break complex tasks into smaller steps
                5. Specify the desired format or structure
                """)
                
                Text("Example Prompts")
                    .font(.headline)
                Text("""
                Simple: "List 5 benefits of daily exercise"
                Complex: "Write a 500-word short story about a robot learning human emotions in a futuristic city, using a third-person perspective and a hopeful tone"
                """)
            }
            .padding()
        }
        .navigationTitle("Learn About Prompts")
    }
}
