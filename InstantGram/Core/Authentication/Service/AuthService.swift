//
//  AuthService.swift
//  InstantGram
//
//  Created by Justin Hold on 5/25/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class AuthService {
	
	@Published var userSession: FirebaseAuth.User?
	@Published var currentUser: User?
	static let shared = AuthService()
	
	init() {
		Task { try await loadUserData() }
	}
	
	// MARK: LOGIN
	@MainActor
	func login(withEmail email: String, password: String) async throws {
		do {
			let result = try await Auth.auth().signIn(withEmail: email, password: password)
			self.userSession = result.user
			try await loadUserData()
		} catch {
			print("DEBUG: Failed to log user in with error: \(error.localizedDescription)")
		}
	}
	
	// MARK: CREATE USER
	@MainActor
	func createUser(email: String, password: String, username: String) async throws {
		do {
			let result = try await Auth.auth().createUser(
				withEmail: email,
				password: password
			)
			self.userSession = result.user
			await uploadUserData(
				uid: result.user.uid,
				username: username,
				email: email
			)
		} catch {
			print("DEBUG: Failed to register user with error: \(error.localizedDescription)")
		}
	}
	
	// MARK: LOAD USER DATA
	@MainActor
	func loadUserData() async throws {
		self.userSession = Auth.auth().currentUser
		guard let currentUID = userSession?.uid else { return }
		self.currentUser = try await UserService.fetchUser(withUID: currentUID)
	}
	
	// MARK: SIGNOUT
	func signOut() {
		try? Auth.auth().signOut()
		self.userSession = nil
		self.currentUser = nil
	}
	
	// MARK: UPLOAD USER DATA
	private func uploadUserData(
		uid: String,
		username: String,
		email: String
	) async {
		
		let user = User(
			id: uid,
			username: username,
			email: email
		)
		
		self.currentUser = user
		guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
		try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
	}
}
