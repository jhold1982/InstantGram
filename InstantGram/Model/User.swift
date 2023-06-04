//
//  User.swift
//  InstantGram
//
//  Created by Justin Hold on 5/17/23.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
	let id: String
	var username: String
	var profileImageURL: String?
	var fullname: String?
	var bio: String?
	let email: String
	
	var isCurrentUser: Bool {
		guard let currentUID = Auth.auth().currentUser?.uid else { return false }
		return currentUID == id
	}
}

extension User {
	static var mockUsers: [User] = [
		
		.init(
			id: NSUUID().uuidString,
			username: "SeanHoward",
			profileImageURL: "death",
			fullname: "Sean Howard",
			bio: "I used to have a Tesla.",
			email: "sean.howard@onepeloton.com"
		),
		
		.init(
			id: NSUUID().uuidString,
			username: "JasonYouvert",
			profileImageURL: "TheGreatTurn",
			fullname: "Jason Youvert",
			bio: "I drive a Tesla and have lots of shoes.",
			email: "jason.youvert@onepeloton.com"
		),
		
		.init(
			id: NSUUID().uuidString,
			username: "Maxwell",
			profileImageURL: "lateralus",
			fullname: "Maxwell Ebneter",
			bio: "I have all the guns and a truck.",
			email: "maxwell.ebneter@onepeloton.com"
		),
		
		.init(
			id: NSUUID().uuidString,
			username: "MattAhrenstein",
			profileImageURL: "heptagram",
			fullname: "Matthew Ahrenstein",
			bio: "I have more guns than Max.",
			email: "matt@ahrenstein.com"
		)
	]
}
