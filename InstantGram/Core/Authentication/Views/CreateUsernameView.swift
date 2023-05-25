//
//  CreateUsernameView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/17/23.
//

import SwiftUI

struct CreateUsernameView: View {
	@Environment(\.dismiss) var dismiss
	@State private var username = ""
    var body: some View {
		VStack(spacing: 12) {
			Text("Create your username")
				.modifier(CustomHeaderText())
			
			Text("Come up with something fun and unique!")
				.modifier(CustomSubheaderText())
			
			TextField("Username", text: $username)
				.textInputAutocapitalization(.never)
				.modifier(TextFieldModifier())
				.padding(.top)
			
			// Button moves to next screen
			NavigationLink {
				CreatePasswordView()
					.navigationBarBackButtonHidden()
			} label: {
				Text("Next")
					.modifier(CustomButtonModifier())
			}
			.padding(.vertical)
			Spacer()
		}
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				Image(systemName: "chevron.left")
					.imageScale(.large)
					.onTapGesture {
						dismiss()
					}
			}
		}
    }
}

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
