//
//  FeedCell.swift
//  InstantGram
//
//  Created by Justin Hold on 5/15/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
		VStack {
			// Image + Username
			HStack {
				Image("TheGreatTurn")
					.resizable()
					.scaledToFill()
					.frame(width: 40, height: 40)
					.clipShape(Circle())
				
				Text("The Great Turn")
					.font(.footnote)
					.fontWeight(.semibold)
				Spacer()
			}
			.padding(.leading, 8)
			
			// Post Image
			Image("lateralus")
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
			Text("23 Likes")
				.font(.footnote)
				.fontWeight(.semibold)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.leading, 10)
				.padding(.top, 1)
			
			// Caption label
			HStack {
				Text("TheGreatTurn").fontWeight(.semibold) +
				Text("This is a test caption")
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
        FeedCell()
    }
}
