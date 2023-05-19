//
//  ProfileHeaderView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/19/23.
//

import SwiftUI

struct ProfileHeaderView: View {
	let user: User
    var body: some View {
		VStack(spacing: 10) {
			
			// Picture and Stats
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
			
			// Name and Bio
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
			
			// Action Button
			Button {
				//
			} label: {
				Text("Edit Profile")
					.font(.subheadline)
					.fontWeight(.semibold)
					.frame(width: 360, height: 32)
					.foregroundColor(.black)
					.overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
			}
			Divider()
		}
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
		ProfileHeaderView(user: User.mockUsers[1])
    }
}
