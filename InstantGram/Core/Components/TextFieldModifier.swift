//
//  TextFieldModifier.swift
//  InstantGram
//
//  Created by Justin Hold on 5/17/23.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.subheadline)
			.padding(12)
			.background(Color(.systemGray6))
			.cornerRadius(10)
			.padding(.horizontal, 24)
	}
}
