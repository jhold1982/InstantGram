//
//  MainTabView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/12/23.
//

import SwiftUI

struct MainTabView: View {
	@State private var selectedTab = 0
    var body: some View {
		TabView(selection: $selectedTab) {
			FeedView()
				.tabItem {
					Image(systemName: "house")
				}
				.onAppear {
					selectedTab = 0
				}
				.tag(0)
			SearchView()
				.tabItem {
					Image(systemName: "magnifyingglass")
				}
				.onAppear {
					selectedTab = 1
				}
				.tag(1)
			UploadPostView(tabIndex: $selectedTab)
				.tabItem {
					Image(systemName: "plus.square")
				}
				.onAppear {
					selectedTab = 2
				}
				.tag(2)
			Text("Notifications")
				.tabItem {
					Image(systemName: "heart")
				}
				.onAppear {
					selectedTab = 3
				}
				.tag(3)
			CurrentUserProfileView(user: User.mockUsers[0])
				.tabItem {
					Image(systemName: "person")
				}
				.onAppear {
					selectedTab = 4
				}
				.tag(4)
		}
		.accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
