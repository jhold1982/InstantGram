//
//  ProfileView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/12/23.
//

import SwiftUI

struct ProfileView: View {
	private let gridItems: [GridItem] = [
		.init(.flexible(), spacing: 1),
		.init(.flexible(), spacing: 1),
		.init(.flexible(), spacing: 1)
	]
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
						Text("Alpha Chad")
							.font(.footnote)
							.fontWeight(.semibold)
						Text("Praise Kek!")
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
				LazyVGrid(columns: gridItems, spacing: 2) {
					ForEach(0...14, id: \.self) { index in
						Image("death")
							.resizable()
							.scaledToFill()
					}
				}
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
