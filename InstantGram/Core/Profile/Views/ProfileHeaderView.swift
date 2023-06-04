//
//  ProfileHeaderView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/19/23.
//

import SwiftUI

struct ProfileHeaderView: View {
	@State private var showEditProfile = false
	let user: User
    var body: some View {
		VStack(spacing: 10) {
			// MARK: Picture and Stats
			HStack {
				Image(user.profileImageURL ?? "")
					.resizable()
					.scaledToFill()
					.frame(width: 80, height: 80)
					.clipShape(Circle())
				Spacer()
				HStack(spacing: 8) {
					UserStatView(value: 3, title: "Posts")
					UserStatView(value: 12, title: "Followers")
					UserStatView(value: 24, title: "Following")
				}
			}
			.padding(.horizontal)
			// MARK: Name and Bio
			VStack(alignment: .leading, spacing: 4) {
				if let fullname = user.fullname {
					Text(fullname)
						.font(.footnote)
						.fontWeight(.semibold)
				}
				if let bio = user.bio {
					Text(bio)
						.font(.footnote)
				}
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal)
			
			// MARK: Action Button
			Button {
				if user.isCurrentUser {
					showEditProfile.toggle()
				} else {
					print("DEBUG: Show Follow Button...")
				}
			} label: {
				Text(user.isCurrentUser ? "Edit Profile" : "Follow")
					.font(.subheadline)
					.fontWeight(.semibold)
					.frame(width: 360, height: 32)
					.background(user.isCurrentUser ? .white : Color(.systemBlue))
					.foregroundColor(user.isCurrentUser ? .black : .white)
					.cornerRadius(6)
					.overlay(
						RoundedRectangle(cornerRadius: 6)
							.stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
					)
			}
			Divider()
		}
		.fullScreenCover(isPresented: $showEditProfile) {
			EditProfileView(user: user)
		}
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
		ProfileHeaderView(user: User.mockUsers[1])
    }
}
