//
//  LogInViewModel.swift
//  InstantGram
//
//  Created by Justin Hold on 5/31/23.
//

import Foundation

class LoginViewModel: ObservableObject {
	@Published var email = ""
	@Published var password = ""
	
	func signIn() async throws {
		try await AuthService.shared.login(withEmail: email, password: password)
	}
}
