import SwiftUI

struct ReadingView: View {
    let story: Story
    let chapterIndex: Int
    @State private var fontSize: CGFloat = 16
    @State private var showSettings = false
    @Environment(\.dismiss) private var dismiss
    
    var currentChapter: Chapter {
        story.chapters[chapterIndex]
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ChapterHeader(story: story, chapter: currentChapter, chapterIndex: chapterIndex)
                
                Text(currentChapter.content)
                    .font(.system(size: fontSize))
                    .lineSpacing(6)
                    .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showSettings.toggle()
                }) {
                    Image(systemName: "textformat.size")
                }
            }
        }
        .sheet(isPresented: $showSettings) {
            ReadingSettingsView(fontSize: $fontSize)
        }
        .safeAreaInset(edge: .bottom) {
            ChapterNavigationBar(
                story: story,
                currentChapterIndex: chapterIndex,
                onPreviousChapter: previousChapter,
                onNextChapter: nextChapter
            )
        }
    }
    
    private func previousChapter() {
        if chapterIndex > 0 {
            dismiss()
        }
    }
    
    private func nextChapter() {
        if chapterIndex < story.chapters.count - 1 {
            dismiss()
        }
    }
}

struct ChapterHeader: View {
    let story: Story
    let chapter: Chapter
    let chapterIndex: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(story.title)
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Chapter \(chapterIndex + 1): \(chapter.title)")
                .font(.headline)
                .foregroundColor(.secondary)
            
            HStack {
                Text("by \(story.author)")
                Spacer()
                Text("\(chapter.wordCount) words")
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct ChapterNavigationBar: View {
    let story: Story
    let currentChapterIndex: Int
    let onPreviousChapter: () -> Void
    let onNextChapter: () -> Void
    
    var hasPreviousChapter: Bool {
        currentChapterIndex > 0
    }
    
    var hasNextChapter: Bool {
        currentChapterIndex < story.chapters.count - 1
    }
    
    var body: some View {
        HStack {
            Button(action: onPreviousChapter) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Previous")
                }
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(hasPreviousChapter ? .primary : .secondary)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
                .cornerRadius(20)
            }
            .disabled(!hasPreviousChapter)
            
            Spacer()
            
            Text("\(currentChapterIndex + 1) of \(story.chapters.count)")
                .font(.caption)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button(action: onNextChapter) {
                HStack {
                    Text("Next")
                    Image(systemName: "chevron.right")
                }
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(hasNextChapter ? .primary : .secondary)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
                .cornerRadius(20)
            }
            .disabled(!hasNextChapter)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.systemBackground))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -2)
    }
}

struct ReadingSettingsView: View {
    @Binding var fontSize: CGFloat
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Font Size")
                        .font(.headline)
                    
                    HStack {
                        Text("A")
                            .font(.caption)
                        
                        Slider(value: $fontSize, in: 12...24, step: 1)
                        
                        Text("A")
                            .font(.title3)
                    }
                    
                    Text("Sample text at current size")
                        .font(.system(size: fontSize))
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Reading Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        ReadingView(story: Story.sampleStories[0], chapterIndex: 0)
    }
}