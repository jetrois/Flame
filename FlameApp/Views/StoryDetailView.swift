import SwiftUI

struct StoryDetailView: View {
    let story: Story
    @State private var isBookmarked = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeaderSection(story: story, isBookmarked: $isBookmarked)
                
                MetadataSection(story: story)
                
                SummarySection(story: story)
                
                ChaptersSection(story: story)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isBookmarked.toggle()
                }) {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(isBookmarked ? .orange : .primary)
                }
            }
        }
    }
}

struct HeaderSection: View {
    let story: Story
    @Binding var isBookmarked: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 120, height: 180)
                .cornerRadius(12)
                .overlay(
                    Image(systemName: "book.closed")
                        .font(.title)
                        .foregroundColor(.secondary)
                )
            
            VStack(alignment: .leading, spacing: 12) {
                Text(story.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("by \(story.author)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 16) {
                    StatView(value: "\(story.kudos)", label: "Kudos", icon: "heart")
                    StatView(value: "\(story.comments)", label: "Comments", icon: "bubble.left")
                    StatView(value: "\(story.bookmarks)", label: "Bookmarks", icon: "bookmark")
                }
                
                Button(action: {}) {
                    Text("Read Story")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct StatView: View {
    let value: String
    let label: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.caption)
                .fontWeight(.medium)
            Text(label)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
}

struct MetadataSection: View {
    let story: Story
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Story Info")
                .font(.headline)
                .fontWeight(.semibold)
            
            VStack(alignment: .leading, spacing: 8) {
                MetadataRow(label: "Word Count", value: "\(story.wordCount) words")
                MetadataRow(label: "Chapters", value: "\(story.chapters.count)")
                MetadataRow(label: "Language", value: story.language)
                MetadataRow(label: "Status", value: story.isCompleted ? "Complete" : "In Progress")
                MetadataRow(label: "Last Updated", value: DateFormatter.shortDate.string(from: story.lastUpdated))
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(story.tags, id: \.self) { tag in
                        Text(tag)
                            .font(.caption)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.blue.opacity(0.1))
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 1)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct MetadataRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .font(.subheadline)
                .fontWeight(.medium)
        }
    }
}

struct SummarySection: View {
    let story: Story
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Summary")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(story.summary)
                .font(.body)
                .foregroundColor(.primary)
                .lineSpacing(4)
        }
    }
}

struct ChaptersSection: View {
    let story: Story
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Chapters")
                .font(.headline)
                .fontWeight(.semibold)
            
            ForEach(Array(story.chapters.enumerated()), id: \.element.id) { index, chapter in
                NavigationLink(destination: ReadingView(story: story, chapterIndex: index)) {
                    ChapterRow(chapter: chapter, index: index + 1)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct ChapterRow: View {
    let chapter: Chapter
    let index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Chapter \(index)")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                Text(chapter.title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("\(chapter.wordCount) words")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}

#Preview {
    NavigationView {
        StoryDetailView(story: Story.sampleStories[0])
    }
}