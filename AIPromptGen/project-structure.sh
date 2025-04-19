#!/bin/bash

# Define the base directory for the project
PROJECT_NAME="AIPromptGenerator"
BASE_DIR="./${PROJECT_NAME}"

# Create the main project directory
mkdir -p "${BASE_DIR}"

# Create an empty .xcodeproj folder (this would normally be created by Xcode)
mkdir -p "${BASE_DIR}/${PROJECT_NAME}.xcodeproj"

# Create the Sources directory and its subdirectories
mkdir -p "${BASE_DIR}/Sources/Models"
mkdir -p "${BASE_DIR}/Sources/Views"
mkdir -p "${BASE_DIR}/Sources/ViewModels"
mkdir -p "${BASE_DIR}/Sources/Extensions"
mkdir -p "${BASE_DIR}/Sources/Services"
mkdir -p "${BASE_DIR}/Sources/App"

# Create the Assets directories
mkdir -p "${BASE_DIR}/Assets.xcassets/AppIcon.appiconset"

# Create the Preview Content directory
mkdir -p "${BASE_DIR}/Preview Content/Preview Assets.xcassets"

# Create empty Swift files in the Models directory
touch "${BASE_DIR}/Sources/Models/Prompt.swift"
touch "${BASE_DIR}/Sources/Models/Feedback.swift"
touch "${BASE_DIR}/Sources/Models/PromptCategory.swift"

# Create empty Swift files in the Views directory
touch "${BASE_DIR}/Sources/Views/MainView.swift"
touch "${BASE_DIR}/Sources/Views/PromptGenerationView.swift"
touch "${BASE_DIR}/Sources/Views/ResultsView.swift"
touch "${BASE_DIR}/Sources/Views/SavedPromptsView.swift"
touch "${BASE_DIR}/Sources/Views/EducationalResourcesView.swift"

# Create empty Swift files in the ViewModels directory
touch "${BASE_DIR}/Sources/ViewModels/PromptViewModel.swift"

# Create empty Swift files in the Extensions directory
touch "${BASE_DIR}/Sources/Extensions/String+Extensions.swift"

# Create empty Swift files in the Services directory
touch "${BASE_DIR}/Sources/Services/PromptGeneratorService.swift"
touch "${BASE_DIR}/Sources/Services/StorageService.swift"

# Create empty Swift files in the App directory
touch "${BASE_DIR}/Sources/App/AIPromptGeneratorApp.swift"

# Add basic content to empty files
echo "import Foundation\n\nstruct Prompt {\n    // TODO: Implement Prompt model\n}" > "${BASE_DIR}/Sources/Models/Prompt.swift"
echo "import Foundation\n\nstruct Feedback {\n    // TODO: Implement Feedback model\n}" > "${BASE_DIR}/Sources/Models/Feedback.swift"
echo "import Foundation\n\nenum PromptCategory {\n    // TODO: Implement PromptCategory enum\n}" > "${BASE_DIR}/Sources/Models/PromptCategory.swift"

echo "import SwiftUI\n\nstruct MainView: View {\n    var body: some View {\n        Text(\"Main View\")\n    }\n}" > "${BASE_DIR}/Sources/Views/MainView.swift"
echo "import SwiftUI\n\nstruct PromptGenerationView: View {\n    var body: some View {\n        Text(\"Prompt Generation View\")\n    }\n}" > "${BASE_DIR}/Sources/Views/PromptGenerationView.swift"
echo "import SwiftUI\n\nstruct ResultsView: View {\n    var body: some View {\n        Text(\"Results View\")\n    }\n}" > "${BASE_DIR}/Sources/Views/ResultsView.swift"
echo "import SwiftUI\n\nstruct SavedPromptsView: View {\n    var body: some View {\n        Text(\"Saved Prompts View\")\n    }\n}" > "${BASE_DIR}/Sources/Views/SavedPromptsView.swift"
echo "import SwiftUI\n\nstruct EducationalResourcesView: View {\n    var body: some View {\n        Text(\"Educational Resources View\")\n    }\n}" > "${BASE_DIR}/Sources/Views/EducationalResourcesView.swift"

echo "import Foundation\n\nclass PromptViewModel: ObservableObject {\n    // TODO: Implement PromptViewModel\n}" > "${BASE_DIR}/Sources/ViewModels/PromptViewModel.swift"

echo "import Foundation\n\nextension String {\n    // TODO: Implement String extensions\n}" > "${BASE_DIR}/Sources/Extensions/String+Extensions.swift"

echo "import Foundation\n\nclass PromptGeneratorService {\n    // TODO: Implement PromptGeneratorService\n}" > "${BASE_DIR}/Sources/Services/PromptGeneratorService.swift"
echo "import Foundation\n\nclass StorageService {\n    // TODO: Implement StorageService\n}" > "${BASE_DIR}/Sources/Services/StorageService.swift"

echo "import SwiftUI\n\n@main\nstruct AIPromptGeneratorApp: App {\n    var body: some Scene {\n        WindowGroup {\n            MainView()\n        }\n    }\n}" > "${BASE_DIR}/Sources/App/AIPromptGeneratorApp.swift"

# Create a README file
echo "# ${PROJECT_NAME}\n\nAn iOS application for generating AI prompts using SwiftUI." > "${BASE_DIR}/README.md"

echo "Project structure for ${PROJECT_NAME} created successfully!"

# Display the tree structure of the created project
echo "Created project structure:"
if command -v tree >/dev/null 2>&1; then
    tree "${BASE_DIR}"
else
    find "${BASE_DIR}" -type d -o -type f | sort | sed -e "s/[^-][^\/]*\// |  /g" -e "s/|\([^ ]\)/|-\1/"
fi

