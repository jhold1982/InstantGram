//
//  ProfileView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/12/23.
//

import SwiftUI

struct ProfileView: View {
	
	let user: User
	
	var posts: [Post] {
		return Post.mockPosts.filter({ $0.user?.username == user.username })
	}
	
    var body: some View {
		ScrollView {
			// MARK: Header
			ProfileHeaderView(user: User.mockUsers[2])
			
			// MARK: Post Grid
			PostGridView(posts: posts)
		}
		.navigationTitle("Profile")
		.navigationBarTitleDisplayMode(.inline)
			

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
		ProfileView(user: User.mockUsers[0])
    }
}
