//
//  CreatePasswordView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/17/23.
//

import SwiftUI

struct CreatePasswordView: View {
	@Environment(\.dismiss) var dismiss
	@State private var password = ""
    var body: some View {
		VStack(spacing: 12) {
			
			Text("Create Password")
				.modifier(CustomHeaderText())
			
			Text("Must be at least 6 characters long")
				.modifier(CustomSubheaderText())
			
			SecureField("Password", text: $password)
				.textInputAutocapitalization(.never)
				.modifier(TextFieldModifier())
				.padding(.top)
			
			NavigationLink {
				CompleteSignUpView()
					.navigationBarBackButtonHidden()
			} label: {
				Text("Sign Up")
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
