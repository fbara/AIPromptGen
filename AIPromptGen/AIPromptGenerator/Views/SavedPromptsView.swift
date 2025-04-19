//
//  SavedPromptsView.swift
//  AIPromptGen
//
//  Created by Frank Bara on 4/19/25.
//

import SwiftUI

struct SavedPromptsView: View {
    @StateObject private var viewModel = PromptViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.savedPrompts) { prompt in
                VStack(alignment: .leading) {
                    Text(prompt.text)
                        .lineLimit(2)
                    Text(prompt.createdAt, style: .date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .onDelete { indexSet in
                viewModel.deletePrompts(at: indexSet)
            }
        }
        .navigationTitle("Saved Prompts")
        .onAppear {
            viewModel.loadSavedPrompts()
        }
    }
}
