//
//  CurrentUserProfileView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/18/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
	let user: User
	var body: some View {
		NavigationStack {
			ScrollView {
				// MARK: - Header
				ProfileHeaderView(user: user)
				
				// MARK: - Post Grid
				PostGridView(user: user)
			}
			.navigationTitle("Profile")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						AuthService.shared.signOut()
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
