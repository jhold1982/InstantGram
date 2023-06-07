//
//  FeedCell.swift
//  InstantGram
//
//  Created by Justin Hold on 5/15/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
	let post: Post
    var body: some View {
		VStack {
			// Image + Username
			HStack {
				if let user = post.user {
					CircularProfileImageView(
						user: user,
						size: .xSmall
					)
					
					Text(user.username)
						.font(.footnote)
						.fontWeight(.semibold)
				}
				Spacer()
			}
			.padding(.leading, 8)
			
			// Post Image
			KFImage(URL(string: post.imageURL))
				.resizable()
				.scaledToFill()
				.frame(height: 400)
				.clipShape(Rectangle())
			
			// Action Buttons
			HStack(spacing: 16) {
				
				Button {
					print("Like post")
				} label: {
					Image(systemName: "heart")
						.imageScale(.large)
				}
				
				Button {
					print("Comment on post")
				} label: {
					Image(systemName: "bubble.right")
						.imageScale(.large)
				}
				
				Button {
					print("Share post")
				} label: {
					Image(systemName: "paperplane")
						.imageScale(.large)
				}
				Spacer()
			}
			.padding(.leading, 8)
			.padding(.top, 4)
			.foregroundColor(.black)
			
			// Likes label
			Text("\(post.likes) likes")
				.font(.footnote)
				.fontWeight(.semibold)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.leading, 10)
				.padding(.top, 1)
			
			// Caption label
			HStack {
				Text("\(post.user?.username ?? "")").fontWeight(.semibold)
				Text(post.caption)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.font(.footnote)
			.padding(.leading, 10)
			.padding(.top, 1)
			
			// Time Stamp
			Text("6h ago")
				.font(.footnote)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.leading, 10)
				.padding(.top, 1)
				.foregroundColor(.gray)
		}
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
		FeedCell(post: Post.mockPosts[1])
    }
}
