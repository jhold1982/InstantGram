//
//  ContentView.swift
//  InstantGram
//
//  Created by Justin Hold on 5/12/23.
//

import SwiftUI

struct ContentView: View {
	@StateObject var viewModel = ContentViewModel()
    var body: some View {
		Group {
			if viewModel.userSession == nil {
				LogInView()
			} else {
				MainTabView()
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
