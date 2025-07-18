import Foundation

struct Story: Identifiable, Codable {
    let id = UUID()
    let title: String
    let author: String
    let coverImageURL: String?
    let summary: String
    let tags: [String]
    let chapters: [Chapter]
    let wordCount: Int
    let language: String
    let isCompleted: Bool
    let lastUpdated: Date
    let kudos: Int
    let comments: Int
    let bookmarks: Int
}

struct Chapter: Identifiable, Codable {
    let id = UUID()
    let title: String
    let content: String
    let wordCount: Int
    let publishedDate: Date
}

extension Story {
    static let sampleStories = [
        Story(
            title: "The Half-Blood Prince",
            author: "J.K. Rowling",
            coverImageURL: nil,
            summary: "Harry Potter returns for his sixth year at Hogwarts...",
            tags: ["Harry Potter", "Adventure", "Magic", "Friendship"],
            chapters: [
                Chapter(title: "The Other Minister", content: "Sample content...", wordCount: 5000, publishedDate: Date()),
                Chapter(title: "Spinner's End", content: "Sample content...", wordCount: 4500, publishedDate: Date())
            ],
            wordCount: 168923,
            language: "English",
            isCompleted: true,
            lastUpdated: Date(),
            kudos: 2847,
            comments: 892,
            bookmarks: 1205
        ),
        Story(
            title: "Winter Is Coming",
            author: "George R.R. Martin",
            coverImageURL: nil,
            summary: "In the frozen lands beyond the Wall...",
            tags: ["Game of Thrones", "Fantasy", "Drama", "Politics"],
            chapters: [
                Chapter(title: "Bran", content: "Sample content...", wordCount: 3500, publishedDate: Date()),
                Chapter(title: "Catelyn", content: "Sample content...", wordCount: 4200, publishedDate: Date())
            ],
            wordCount: 292847,
            language: "English",
            isCompleted: false,
            lastUpdated: Date(),
            kudos: 5692,
            comments: 1547,
            bookmarks: 2893
        )
    ]
}