//
//  UploadPostViewModel.swift
//  InstantGram
//
//  Created by Justin Hold on 5/23/23.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
	@Published var selectedImage: PhotosPickerItem? {
		didSet {
			Task {
				await loadImage(fromItem: selectedImage)
			}
		}
	}
	@Published var postImage: Image?
	private var uiImage: UIImage?
	
	func loadImage(fromItem item: PhotosPickerItem?) async {
		guard let item = item else { return }
		guard let data = try? await item.loadTransferable(type: Data.self) else { return }
		guard let uiImage = UIImage(data: data) else { return }
		self.uiImage = uiImage
		self.postImage = Image(uiImage: uiImage)
	}
	
	func uploadPost(caption: String) async throws {
		
		// make sure someone is logged in otherwise bailout
		guard let uid = Auth.auth().currentUser?.uid else { return }
		
		// make sure there is an image to upload otherwise bailout
		guard let uiImage = uiImage else { return }
		
		// post ID
		let postRef = Firestore.firestore().collection("posts").document()
		
		// upload image before uploading post
		guard let imageURL = try await ImageUploader.uploadImage(image: uiImage) else { return }
		
		// create Post
		let post = Post(
			id: postRef.documentID,
			ownerUID: uid,
			caption: caption,
			likes: 0,
			imageURL: imageURL,
			timestamp: Timestamp()
		)
		
		// try to encode post
		guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
		
		// upload post to Firebase
		try await postRef.setData(encodedPost)
	}
}
