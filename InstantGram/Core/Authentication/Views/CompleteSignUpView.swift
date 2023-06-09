//
//  CompleteSignUpView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/17/23.
//

import SwiftUI

struct CompleteSignUpView: View {
	@Environment(\.dismiss) var dismiss
	@EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
		VStack(spacing: 12) {
			Spacer()
			
			Text("Welcome to InstantGram, \(viewModel.username)")
				.multilineTextAlignment(.center)
				.modifier(CustomHeaderText())
			
			Text("Click below to complete registration")
				.multilineTextAlignment(.center)
				.modifier(CustomSubheaderText())
			
			// Registration Button
			Button {
				Task {
					try await viewModel.createUser()
				}
			} label: {
				Text("Complete Sign Up")
					.modifier(CustomButtonModifier())
			}
			.padding(.vertical)
			
			// Pushing content further app to match previous screens
			Group {
				Spacer()
				Spacer()
				Spacer()
				Spacer()
				Spacer()
				Spacer()
				Spacer()
			}
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

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
			.environmentObject(RegistrationViewModel())
    }
}
