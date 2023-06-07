//
//  ProfileView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/12/23.
//

import SwiftUI

struct ProfileView: View {
	let user: User
    var body: some View {
		ScrollView {
			// MARK: - Profile Header
			ProfileHeaderView(user: user)
			
			// MARK: - Post Grid
			PostGridView(user: user)
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
