//
//  Post.swift
//  InstantGram
//
//  Created by Justin Hold on 5/19/23.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
	let id: String
	let ownerUID: String
	let caption: String
	var likes: Int
	let imageURL: String
	let timestamp: Timestamp
	var user: User?
}

extension Post {
	static var mockPosts: [Post] = [
		.init(
			id: NSUUID().uuidString,
			ownerUID: NSUUID().uuidString,
			caption: "Dr Pepper is Life.",
			likes: 13,
			imageURL: "heptagram",
			timestamp: Timestamp(),
			user: User.mockUsers[0]
		),
		.init(
			id: NSUUID().uuidString,
			ownerUID: NSUUID().uuidString,
			caption: "I love Taco Bueno!",
			likes: 27,
			imageURL: "lateralus",
			timestamp: Timestamp(),
			user: User.mockUsers[1]
		),
		.init(
			id: NSUUID().uuidString,
			ownerUID: NSUUID().uuidString,
			caption: "I miss Veggie Express.",
			likes: 40,
			imageURL: "TheGreatTurn",
			timestamp: Timestamp(),
			user: User.mockUsers[2]
		),
		.init(
			id: NSUUID().uuidString,
			ownerUID: NSUUID().uuidString,
			caption: "Chipotle is my life.",
			likes: 53,
			imageURL: "death",
			timestamp: Timestamp(),
			user: User.mockUsers[3]
		)
	]
}
