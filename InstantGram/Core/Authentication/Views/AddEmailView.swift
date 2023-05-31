//
//  AddEmailView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/16/23.
//

import SwiftUI

struct AddEmailView: View {
	@EnvironmentObject var viewModel: RegistrationViewModel
	@Environment(\.dismiss) var dismiss
    var body: some View {
		VStack(spacing: 12) {
			Text("Add your email")
				.modifier(CustomHeaderText())
			
			Text("You'll use this email to sign into your account")
				.modifier(CustomSubheaderText())
			
			TextField("Email", text: $viewModel.email)
				.textInputAutocapitalization(.never)
				.modifier(TextFieldModifier())
				.padding(.top)
			
			// Button moves to next screen
			NavigationLink {
				CreateUsernameView()
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
