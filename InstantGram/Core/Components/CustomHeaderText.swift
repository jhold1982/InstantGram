//
//  CustomHeaderText.swift
//  InstantGram
//
//  Created by Justin Hold on 5/17/23.
//

import Foundation
import SwiftUI

struct CustomHeaderText: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.title2)
			.fontWeight(.bold)
			.padding(.top)
	}
}

struct CustomSubheaderText: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.footnote)
			.foregroundColor(.gray)
			.multilineTextAlignment(.center)
			.padding(.horizontal, 24)
	}
}
