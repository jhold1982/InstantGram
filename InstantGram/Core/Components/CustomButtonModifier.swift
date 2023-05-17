//
//  CustomButtonModifier.swift
//  InstantGram
//
//  Created by Justin Hold on 5/17/23.
//

import Foundation
import SwiftUI

struct CustomButtonModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.subheadline)
			.fontWeight(.semibold)
			.frame(width: 350, height: 44)
			.foregroundColor(.white)
			.background(Color(.systemBlue))
			.cornerRadius(8)
	}
}
