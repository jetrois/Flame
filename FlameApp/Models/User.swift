import Foundation

struct User: Identifiable, Codable {
    let id = UUID()
    let username: String
    let email: String
    let profileImageURL: String?
    let joinDate: Date
    let favoriteStories: [UUID]
    let readingHistory: [ReadingEntry]
}

struct ReadingEntry: Identifiable, Codable {
    let id = UUID()
    let storyId: UUID
    let chapterId: UUID
    let lastReadDate: Date
    let progress: Double
}