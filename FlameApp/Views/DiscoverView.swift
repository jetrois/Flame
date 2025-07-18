import SwiftUI

struct DiscoverView: View {
    @State private var searchText = ""
    @State private var stories = Story.sampleStories
    
    var filteredStories: [Story] {
        if searchText.isEmpty {
            return stories
        } else {
            return stories.filter { story in
                story.title.localizedCaseInsensitiveContains(searchText) ||
                story.author.localizedCaseInsensitiveContains(searchText) ||
                story.tags.contains { $0.localizedCaseInsensitiveContains(searchText) }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(filteredStories) { story in
                            NavigationLink(destination: StoryDetailView(story: story)) {
                                StoryCardView(story: story)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search stories, authors, tags...", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct StoryCardView: View {
    let story: Story
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 120)
                    .cornerRadius(8)
                    .overlay(
                        Image(systemName: "book.closed")
                            .font(.title2)
                            .foregroundColor(.secondary)
                    )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(story.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    
                    Text("by \(story.author)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(story.summary)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                    
                    HStack {
                        Text("\(story.wordCount) words")
                        Text("•")
                        Text(story.language)
                        Text("•")
                        Text(story.isCompleted ? "Complete" : "In Progress")
                    }
                    .font(.caption2)
                    .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(story.tags, id: \.self) { tag in
                        Text(tag)
                            .font(.caption2)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue.opacity(0.1))
                            .foregroundColor(.blue)
                            .cornerRadius(6)
                    }
                }
                .padding(.horizontal, 1)
            }
            
            HStack {
                Label("\(story.kudos)", systemImage: "heart")
                Label("\(story.comments)", systemImage: "bubble.left")
                Label("\(story.bookmarks)", systemImage: "bookmark")
                Spacer()
            }
            .font(.caption2)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    DiscoverView()
}