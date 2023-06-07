//
//  EditProfileView.swift
//  InstantGram
//
//  Created by Justin Hold on 6/1/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
	@Environment(\.dismiss) var dismiss
	@StateObject var viewModel: EditProfileViewModel
	init(user: User) {
		self._viewModel = StateObject(
			wrappedValue: EditProfileViewModel(user: user)
		)
	}
    var body: some View {
		VStack {
			// MARK: Custom Tool Bar
			VStack {
				HStack {
					Button("Cancel") {
						dismiss()
					}
					Spacer()
					Text("Edit Profile")
						.font(.subheadline)
						.fontWeight(.semibold)
					Spacer()
					Button {
						Task {
							try await viewModel.updateUserData()
							dismiss()
						}
					} label: {
						Text("Done")
							.font(.subheadline)
							.fontWeight(.bold)
					}
				}
				.padding(.horizontal)
				Divider()
			}
			// MARK: Edit Profile Pic
			PhotosPicker(selection: $viewModel.selectedImage) {
				VStack {
					if let image = viewModel.profileImage {
						image
							.resizable()
							.foregroundColor(.white)
							.background(.gray)
							.clipShape(Circle())
							.frame(width: 80, height: 80)
					} else {
						CircularProfileImageView(user: viewModel.user, size: .large)
					}
					Text("Edit Profile Picture")
						.font(.footnote)
						.fontWeight(.semibold)
					Divider()
				}
			}
			.padding(.vertical, 8)
			
			// MARK: Edit Name & Bio
			VStack {
				EditProfileRowView(
					title: "Name",
					placeholder: "Enter your name...",
					text: $viewModel.fullname
				)
				EditProfileRowView(
					title: "Bio",
					placeholder: "Tell us about yourself...",
					text: $viewModel.bio
				)
			}
			Spacer()
		}
    }
}

struct EditProfileRowView: View {
	let title: String
	let placeholder: String
	@Binding var text: String
	var body: some View {
		HStack {
			Text(title)
				.padding(.leading, 8)
				.frame(width: 100, alignment: .leading)
			VStack {
				TextField(placeholder, text: $text)
				Divider()
			}
		}
		.font(.subheadline)
		.frame(height: 36)
	}
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
		EditProfileView(user: User.mockUsers[1])
    }
}
