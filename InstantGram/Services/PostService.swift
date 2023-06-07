//
//  PostService.swift
//  InstantGram
//
//  Created by Justin Hold on 6/6/23.
//

import Foundation
import Firebase

struct PostService {
	private static let postsCollection = Firestore.firestore().collection("posts")
	static func fetchFeedPosts() async throws -> [Post] {
		let snapshot = try await postsCollection.getDocuments()
		var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
		for i in 0 ..< posts.count {
			let post = posts[i]
			let ownerUID = post.ownerUID
			let postUser = try await UserService.fetchUser(withUID: ownerUID)
			posts[i].user = postUser
		}
		return posts
	}
	static func fetchUserPosts(uid: String) async throws -> [Post] {
		let snapshot = try await postsCollection.whereField("ownerUID", isEqualTo: uid).getDocuments()
		return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
	}
}
