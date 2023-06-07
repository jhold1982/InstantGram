//
//  PostGridViewModel.swift
//  InstantGram
//
//  Created by Justin Hold on 6/7/23.
//

import Foundation

class PostGridViewModel: ObservableObject {
	@Published var posts = [Post]()
	private let user: User
	init(user: User) {
		self.user = user
		Task {
			try await fetchUserPosts()
		}
	}
	@MainActor
	func fetchUserPosts() async throws {
		self.posts = try await PostService.fetchUserPosts(uid: user.id)
		for i in 0..<posts.count {
			posts[i].user = self.user
		}
	}
}
