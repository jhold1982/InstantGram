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
		TabView {
			
			FeedView()
				.tabItem {
					Image(systemName: "house")
				}
				.tag(0)
			
			SearchView()
				.tabItem {
					Image(systemName: "magnifyingglass")
				}
				.tag(1)
			
			Text("UploadPost")
				.tabItem {
					Image(systemName: "plus.square")
				}
			
			Text("Notifications")
				.tabItem {
					Image(systemName: "heart")
				}
			
			ProfileView()
				.tabItem {
					Image(systemName: "person")
				}
		}
		.accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
