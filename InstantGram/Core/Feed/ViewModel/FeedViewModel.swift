//
//  FeedViewModel.swift
//  InstantGram
//
//  Created by Justin Hold on 6/6/23.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
	@Published var posts = [Post]()
	init() {
		Task {
			try await fetchPosts()
		}
	}
	@MainActor
	func fetchPosts() async throws {
		self.posts = try await PostService.fetchFeedPosts()
	}
}
