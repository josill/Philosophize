import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showingAddSheet = false
    @State private var selectedTopic: String? = nil
    
    init() {
        // Don't set up the observer here
    }

    
    private func showBrowseView() {
        // Select a default topic to show the split view
        selectedTopic = "Existentialism"
    }
    
    // Sample philosophy quotes for the welcome screen
    private let quotes = [
        "The unexamined life is not worth living. - Socrates",
        "I think, therefore I am. - René Descartes",
        "One cannot step twice in the same river. - Heraclitus",
        "Happiness is the highest good. - Aristotle",
        "Man is condemned to be free. - Jean-Paul Sartre"
    ]
    
    var body: some View {
        WelcomeView(quotes: quotes)
//        if selectedTopic == nil {
//            // Full screen welcome view
//            NavigationStack {
//                WelcomeView2(quotes: quotes, onBrowseTopics: {
//                    showBrowseView()
//                })
//                .navigationTitle("Philosophize")
//                    .toolbar {
//                        ToolbarItem {
//                            Button(action: { showBrowseView() }) {
//                                Label("Browse Topics", systemImage: "list.bullet")
//                            }
//                        }
//                    }
//            }
//            .sheet(isPresented: $showingAddSheet) {
//                AddNoteView()
//            }
//        } else {
//            // Split view for browsing topics
//            NavigationSplitView {
//                List {
//                    Section("Philosophy Topics") {
//                        NavigationLink("Existentialism", tag: "Existentialism", selection: $selectedTopic) {
//                            PhilosophyTopicView(topic: "Existentialism")
//                        }
//                        NavigationLink("Ethics", tag: "Ethics", selection: $selectedTopic) {
//                            PhilosophyTopicView(topic: "Ethics")
//                        }
//                        NavigationLink("Metaphysics", tag: "Metaphysics", selection: $selectedTopic) {
//                            PhilosophyTopicView(topic: "Metaphysics")
//                        }
//                        NavigationLink("Epistemology", tag: "Epistemology", selection: $selectedTopic) {
//                            PhilosophyTopicView(topic: "Epistemology")
//                        }
//                    }
//                    
//                    Section {
//                        Button("Back to Welcome") {
//                            selectedTopic = nil
//                        }
//                        .foregroundColor(.blue)
//                    }
//                    
//                    Section("My Notes") {
//                        // This will show user's saved philosophical notes later
//                        Text("You haven't added any notes yet")
//                            .foregroundColor(.secondary)
//                            .italic()
//                    }
//                }
//                .navigationTitle("Philosophize")
//    #if os(macOS)
//                .navigationSplitViewColumnWidth(min: 200, ideal: 250)
//    #endif
//                .toolbar {
//                    ToolbarItem {
//                        Button(action: { showingAddSheet = true }) {
//                            Label("Add Note", systemImage: "note.text.badge.plus")
//                        }
//                    }
//                }
//            } detail: {
//                if let topic = selectedTopic {
//                    PhilosophyTopicView(topic: topic)
//                } else {
//                    Text("Select a topic from the sidebar")
//                }
//            }
//            .sheet(isPresented: $showingAddSheet) {
//                AddNoteView()
//            }
//        }
    }
}

// Placeholder view for when a philosophy topic is selected
struct PhilosophyTopicView: View {
    let topic: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text(topic)
                .font(.largeTitle)
                .bold()
            
            Text("This is where content about \(topic) will appear.")
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .navigationTitle(topic)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                #if os(iOS)
                Button(action: {
                    dismiss()
                }) {
                    Label("Back", systemImage: "arrow.left")
                }
                #endif
            }
        }
    }
}

// View for adding a new philosophical note
struct AddNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("My philosophical thought", text: $title)
                }
                
                Section("Content") {
                    TextEditor(text: $content)
                        .frame(minHeight: 200)
                }
            }
            .navigationTitle("New Philosophical Note")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        // Here we would save the note using SwiftData
                        // For now, just dismiss
                        dismiss()
                    }
                    .disabled(title.isEmpty || content.isEmpty)
                }
            }
        }
        #if os(macOS)
        .frame(width: 600, height: 500)
        #endif
    }
}

// This preview shows the ContentView with the welcome screen
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
