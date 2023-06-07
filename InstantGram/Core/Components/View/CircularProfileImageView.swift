//
//  CircularProfileImageView.swift
//  InstantGram
//
//  Created by Justin Hold on 6/4/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
	case xSmall, small, medium, large
	var dimension: CGFloat {
		switch self {
		case .xSmall:
			return 40
		case .small:
			return 48
		case .medium:
			return 64
		case .large:
			return 80
		}
	}
}

struct CircularProfileImageView: View {
	let user: User
	let size: ProfileImageSize
    var body: some View {
		if let imageURL = user.profileImageURL {
			KFImage(URL(string: imageURL))
				.resizable()
				.scaledToFill()
				.frame(width: size.dimension, height: size.dimension)
				.clipShape(Circle())
		} else {
			Image(systemName: "questionmark.circle.fill")
				.resizable()
				.frame(width: size.dimension, height: size.dimension)
				.clipShape(Circle())
				.foregroundColor(.gray)
		}
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
		CircularProfileImageView(
			user: User.mockUsers[0],
			size: .large
		)
    }
}
