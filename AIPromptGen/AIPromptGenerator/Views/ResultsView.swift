//
//  ResultsView.swift
//  AIPromptGen
//
//  Created by Frank Bara on 4/19/25.
//

import SwiftUI

struct ResultsView: View {
    let prompt: Prompt
    @ObservedObject var viewModel: PromptViewModel
    @State private var rating = 0
    @State private var comment = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Generated Prompt")
                .font(.title2)
                .bold()
            
            Text(prompt.text)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            HStack {
                Button("Copy") {
                    UIPasteboard.general.string = prompt.text
                }
                .buttonStyle(.bordered)
                
                Button("Save") {
                    viewModel.savePrompt(prompt)
                }
                .buttonStyle(.bordered)
                
                ShareLink(item: prompt.text) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
            }
            
            Section(header: Text("Feedback")) {
                Picker("Rating", selection: $rating) {
                    ForEach(1...5, id: \.self) { number in
                        Text("\(number) Stars").tag(number)
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("Optional comment", text: $comment)
                
                Button("Submit Feedback") {
                    viewModel.submitFeedback(
                        for: prompt,
                        rating: rating,
                        comment: comment
                    )
                }
                .disabled(rating == 0)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Prompt Result")
    }
}
