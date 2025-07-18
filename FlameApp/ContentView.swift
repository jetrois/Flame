import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false
    
    var body: some View {
        if isAuthenticated {
            MainTabView()
        } else {
            AuthView(isAuthenticated: $isAuthenticated)
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            DiscoverView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Discover")
                }
            
            LibraryView()
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Library")
                }
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
}