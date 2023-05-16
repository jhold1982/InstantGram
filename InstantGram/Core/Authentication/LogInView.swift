//
//  LogInView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/16/23.
//

import SwiftUI

struct LogInView: View {
	@State private var email = ""
	@State private var password = ""
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
					TextField("Enter your email", text: $email)
						.textInputAutocapitalization(.never)
						.font(.subheadline)
						.padding(12)
						.background(Color(.systemGray6))
						.cornerRadius(10)
						.padding(.horizontal, 24)
					
					SecureField("Password", text: $password)
						.textInputAutocapitalization(.never)
						.font(.subheadline)
						.padding(12)
						.background(Color(.systemGray6))
						.cornerRadius(10)
						.padding(.horizontal, 24)
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
				.frame(maxWidth: .infinity, alignment: .trailing)
				
				// Login Button
				Button {
					print("DEBUG: Login...")
				} label: {
					Text("Login")
						.font(.subheadline)
						.fontWeight(.semibold)
						.frame(width: 360, height: 44)
						.foregroundColor(.white)
						.background(Color(.systemBlue))
						.cornerRadius(8)
				}
				.padding(.vertical)
				
				// Custom OR Divider
				HStack {
					Rectangle()
						.frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
					Text("OR")
						.font(.footnote)
						.fontWeight(.semibold)
					Rectangle()
						.frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
				}
				.foregroundColor(.gray)
				
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
				NavigationLink {
					Text("Sign Up")
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
