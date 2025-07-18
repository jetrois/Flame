import SwiftUI

struct LibraryView: View {
    @State private var selectedFilter = LibraryFilter.all
    @State private var stories = Story.sampleStories
    
    enum LibraryFilter: String, CaseIterable {
        case all = "All"
        case reading = "Reading"
        case completed = "Completed"
        case bookmarked = "Bookmarked"
    }
    
    var filteredStories: [Story] {
        switch selectedFilter {
        case .all:
            return stories
        case .reading:
            return stories.filter { !$0.isCompleted }
        case .completed:
            return stories.filter { $0.isCompleted }
        case .bookmarked:
            return stories
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                FilterBar(selectedFilter: $selectedFilter)
                    .padding(.horizontal)
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(filteredStories) { story in
                            NavigationLink(destination: StoryDetailView(story: story)) {
                                LibraryStoryRow(story: story)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Library")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
            }
        }
    }
}

struct FilterBar: View {
    @Binding var selectedFilter: LibraryView.LibraryFilter
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(LibraryView.LibraryFilter.allCases, id: \.self) { filter in
                    Button(action: {
                        selectedFilter = filter
                    }) {
                        Text(filter.rawValue)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(selectedFilter == filter ? Color.black : Color(.systemGray6))
                            .foregroundColor(selectedFilter == filter ? .white : .primary)
                            .cornerRadius(20)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct LibraryStoryRow: View {
    let story: Story
    
    var body: some View {
        HStack(spacing: 12) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 60, height: 80)
                .cornerRadius(6)
                .overlay(
                    Image(systemName: "book.closed")
                        .font(.title3)
                        .foregroundColor(.secondary)
                )
            
            VStack(alignment: .leading, spacing: 6) {
                Text(story.title)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                Text(story.author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    Text("\(story.chapters.count) chapters")
                    Text("•")
                    Text("\(story.wordCount) words")
                }
                .font(.caption)
                .foregroundColor(.secondary)
                
                HStack {
                    Label("\(story.kudos)", systemImage: "heart")
                    Label("\(story.comments)", systemImage: "bubble.left")
                    Label("\(story.bookmarks)", systemImage: "bookmark")
                }
                .font(.caption2)
                .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
    }
}

#Preview {
    LibraryView()
}