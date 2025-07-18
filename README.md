# Flame 🔥

A beautiful SwiftUI fanfiction reading app inspired by Archive of Our Own (AO3), designed to provide an elegant and immersive reading experience for fanfiction enthusiasts.

## Features

### 📱 Core Functionality
- **Authentication System**: Secure login and signup flow with elegant UI
- **Story Discovery**: Browse and search through fanfiction stories with advanced filtering
- **Library Management**: Personal library with reading history and bookmarks
- **Immersive Reading**: Full-screen reading experience with customizable settings
- **Chapter Navigation**: Seamless navigation between chapters with progress tracking

### 🎨 User Interface
- **Modern SwiftUI Design**: Clean, native iOS interface following Apple's design guidelines
- **Tab-Based Navigation**: Intuitive navigation between Discover, Library, and Profile sections
- **Story Cards**: Beautiful story previews with covers, metadata, and tags
- **Reading Settings**: Customizable font size and reading preferences
- **Responsive Layout**: Optimized for both iPhone and iPad

### 📚 Story Features
- **Rich Metadata**: Story summaries, word counts, chapter listings, and completion status
- **Tagging System**: Browse stories by tags, fandoms, and categories
- **Social Features**: Kudos, comments, and bookmark counts
- **Reading Progress**: Track reading position and history across devices

## Screenshots

The app design is based on carefully crafted mockups and wireframes:

- **Authentication Flow**: Clean login interface with Flame branding
- **Discovery Interface**: Card-based story browsing with search functionality
- **Story Details**: Comprehensive story information with reading options
- **Reading Experience**: Distraction-free reading with chapter navigation
- **Library Management**: Personal collection with filtering options

## Technology Stack

### Core Frameworks
- **SwiftUI**: Apple's modern UI framework for building native iOS interfaces
- **Foundation**: Apple's foundational framework providing essential data types and collections
- **Combine**: Apple's reactive programming framework (prepared for future networking features)

### Development Tools
- **Xcode**: Apple's integrated development environment
- **Swift**: Apple's programming language for iOS development
- **Git**: Version control system for source code management

### Open Source Acknowledgments

This project is built entirely using Apple's native frameworks and tools. No external open source libraries are currently integrated, making it a pure Swift/SwiftUI implementation. This approach ensures:

- **Maximum Performance**: Direct use of Apple's optimized frameworks
- **Long-term Stability**: No dependency on third-party libraries that may become outdated
- **Native User Experience**: Full integration with iOS design patterns and behaviors
- **Minimal Maintenance**: Reduced risk of breaking changes from external dependencies

### Future Open Source Considerations

As the app evolves, we may consider integrating the following open source libraries:

- **Networking**: For API communication with fanfiction platforms
- **Image Loading**: For efficient cover image caching and loading
- **Database**: For local story caching and offline reading
- **Analytics**: For understanding user behavior and app performance

## Project Structure

```
FlameApp/
├── FlameAppApp.swift          # App entry point
├── ContentView.swift          # Main app coordinator
├── Models/
│   ├── Story.swift           # Story and Chapter data models
│   └── User.swift            # User and reading data models
└── Views/
    ├── AuthView.swift        # Login/signup interface
    ├── DiscoverView.swift    # Story discovery and search
    ├── LibraryView.swift     # Personal library management
    ├── StoryDetailView.swift # Story information and metadata
    └── ReadingView.swift     # Reading interface with navigation
```

## Getting Started

### Prerequisites
- iOS 17.0 or later
- Xcode 15.0 or later
- macOS Sonoma or later

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/jetrois/Flame.git
   ```

2. Open the project in Xcode:
   ```bash
   cd Flame
   open FlameApp.xcodeproj
   ```

3. Build and run the project in Xcode (⌘R)

### Development Setup
The project includes sample data for development and testing. No additional setup or API keys are required to run the app locally.

## Design Philosophy

Flame is designed with the following principles:

- **User-Centric**: Every feature is designed to enhance the reading experience
- **Native Feel**: Leverages iOS design patterns for familiar interactions
- **Performance First**: Optimized for smooth scrolling and quick navigation
- **Accessibility**: Built with VoiceOver and accessibility features in mind
- **Privacy-Focused**: Minimal data collection with user control over personal information

## Contributing

We welcome contributions! Please feel free to submit issues, feature requests, or pull requests.

### Development Guidelines
- Follow Apple's Swift style guide
- Use SwiftUI best practices and design patterns
- Maintain compatibility with iOS 17+
- Include appropriate documentation and comments
- Test on both iPhone and iPad form factors

## License

This project is open source and available under the MIT License.

## Acknowledgments

- Inspired by Archive of Our Own (AO3) and the fanfiction community
- UI mockups and wireframes created during the design phase
- Built with Apple's SwiftUI framework and native iOS technologies

---

**Made with ❤️ for the fanfiction community**