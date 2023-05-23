//
//  UploadPostView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/22/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
	@State private var caption = ""
	@State private var imagePickerPresented = false
	@State private var photoItem: PhotosPickerItem?
	@StateObject var viewModel = UploadPostViewModel()
	@Binding var tabIndex: Int
    var body: some View {
		VStack {
			// MARK: Action Toolbar
			HStack {
				Button {
					caption = ""
					viewModel.selectedImage = nil
					viewModel.postImage = nil
					tabIndex = 0
				} label: {
					Text("Cancel")
				}
				Spacer()
				Text("New Post")
					.fontWeight(.semibold)
				Spacer()
				Button {
					print("DEBUG: Upload Post...")
				} label: {
					Text("Upload")
						.fontWeight(.semibold)
				}
			}
			.padding(.horizontal)
			// MARK: Post Image & Caption
			HStack(spacing: 8) {
				if let image = viewModel.postImage {
					image
						.resizable()
						.scaledToFill()
						.frame(width: 100, height: 100)
						.clipped()
				}
				TextField("Enter a caption...", text: $caption, axis: .vertical)
			}
			.padding()
			Spacer()
		}
		.photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
		.onAppear {
			imagePickerPresented.toggle()
		}
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
		UploadPostView(tabIndex: .constant(0))
    }
}
