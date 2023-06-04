//
//  EditProfileViewModel.swift
//  InstantGram
//
//  Created by Justin Hold on 6/2/23.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
	@Published var user: User
	@Published var bio = ""
	@Published var fullname = ""
	@Published var profileImage: Image?
	private var uiImage: UIImage?
	@Published var selectedImage: PhotosPickerItem? {
		didSet {
			Task {
				await loadImage(fromItem: selectedImage)
			}
		}
	}
	init(user: User) {
		self.user = user
	}
	func loadImage(fromItem item: PhotosPickerItem?) async {
		guard let item = item else { return }
		guard let data = try? await item.loadTransferable(type: Data.self) else { return }
		guard let uiImage = UIImage(data: data) else { return }
		self.uiImage = uiImage
		self.profileImage = Image(uiImage: uiImage)
	}
	func updateUserData() async throws {
		// Update Profile Image If Changed
		
		var data = [String: Any]()
		if let uiImage = uiImage {
			let imageURL = try? await ImageUploader.uploadImage(image: uiImage)
			data["profileImageURL"] = imageURL
		}
		// Update Name If Changed
		/// If the bio is not empty and the user bio is not equal to the @State private var bio = "" then...
		if !fullname.isEmpty && user.fullname != fullname {
			data["fullname"] = fullname
		}
		// Update Bio If Changed
		/// If the bio is not empty and the user bio is not equal to the @State private var bio = "" then...
		if !bio.isEmpty && user.bio != bio {
			data["bio"] = bio
		}
		if !data.isEmpty {
			try await Firestore.firestore().collection("users").document(user.id).updateData(data)
		}
	}
}
