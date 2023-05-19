//
//  CurrentUserProfileView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/18/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
	
	let user: User
	
	var posts: [Post] {
		return Post.mockPosts.filter({ $0.user?.username == user.username })
	}
	
	var body: some View {
		NavigationStack {
			ScrollView {
				// MARK: Header
				VStack(spacing: 10) {
					
					// Picture and Stats
					HStack {
						Image("heptagram")
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
						Text("\(user.fullname ?? "")")
							.font(.footnote)
							.fontWeight(.semibold)
						Text(user.bio ?? "")
							.font(.footnote)
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
				
				// MARK: Post Grid
				PostGridView(posts: posts)
			}
			.navigationTitle("Profile")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						
					} label: {
						Image(systemName: "line.3.horizontal")
							.foregroundColor(.black)
					}
				}
			}
		}
	}
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
		CurrentUserProfileView(user: User.mockUsers[3])
    }
}
