//
//  LogInView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/16/23.
//

import SwiftUI

struct LogInView: View {
	@StateObject var viewModel = LoginViewModel()
    var body: some View {
		NavigationStack {
			VStack {
				Spacer()
				// App Logo Image
				Image("Instagram")
					.resizable()
					.scaledToFit()
					.frame(width: 200, height: 100)
					
				// Email PW Text Fields
				VStack {
					TextField("Email", text: $viewModel.email)
						.textInputAutocapitalization(.never)
						.modifier(TextFieldModifier())
					
					SecureField("Password", text: $viewModel.password)
						.textInputAutocapitalization(.never)
						.modifier(TextFieldModifier())
				}
				// Forgot Password Button
				Button {
					print("DEBUG: Show Forgot Password...")
				} label: {
					Text("Forgot Password?")
						.font(.footnote)
						.fontWeight(.semibold)
						.padding(.top)
						.padding(.trailing, 28)
				}
				.frame(
					maxWidth: .infinity,
					alignment: .trailing
				)
				
				// Login Button
				Button {
					Task {
						try await viewModel.signIn()
					}
				} label: {
					Text("Login")
						.modifier(CustomButtonModifier())
				}
				.padding(.vertical)
				
				// Custom "OR" Divider
				HStack {
					Rectangle()
						.frame(
							width: (UIScreen.main.bounds.width / 2) - 40,
							height: 0.5
						)
					Text("OR")
						.font(.footnote)
						.fontWeight(.semibold)
					Rectangle()
						.frame(
							width: (UIScreen.main.bounds.width / 2) - 40,
							height: 0.5
						)
				}
				.foregroundColor(.gray)
				
				// Continue with Facebook
				HStack {
					Image("Facebook")
						.resizable()
						.frame(width: 20, height: 20)
					Text("Continue with Facebook")
						.font(.footnote)
						.fontWeight(.semibold)
						.foregroundColor(Color(.systemBlue))
				}
				.padding(.top, 8)
				
				Spacer()
				Divider()
				
				// Sign Up 
				NavigationLink {
					AddEmailView()
						.navigationBarBackButtonHidden()
				} label: {
					HStack(spacing: 3) {
						Text("Don't have an account?")
						Text("Sign Up")
							.fontWeight(.semibold)
					}
					.font(.footnote)
				}
				.padding(.vertical, 16)
			}
		}
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
