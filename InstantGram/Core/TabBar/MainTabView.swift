//
//  MainTabView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
		TabView {
			
			Text("Feed")
				.tabItem {
					Image(systemName: "house")
				}
			
			Text("Search")
				.tabItem {
					Image(systemName: "magnifyingglass")
				}
			
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
