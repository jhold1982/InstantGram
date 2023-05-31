//
//  ContentView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/12/23.
//

import SwiftUI

struct ContentView: View {
	@StateObject var viewModel = ContentViewModel()
	@StateObject var registrationViewModel = RegistrationViewModel()
    var body: some View {
		Group {
			if viewModel.userSession == nil {
				LogInView()
					.environmentObject(registrationViewModel)
			} else if let currentUser = viewModel.currentUser {
				MainTabView(user: currentUser)
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
