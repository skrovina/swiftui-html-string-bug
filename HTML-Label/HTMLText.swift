import Foundation
import SwiftUI

struct HTMLText: UIViewRepresentable {
	var htmlText: String
	init(_ htmlText: String) {
		self.htmlText = htmlText
	}

    func makeUIView(context: Context) -> HTMLLabel {
        let label = HTMLLabel()
		label.setHtml(htmlText, asynchronously: true)
        return label
    }

	func updateUIView(_ label: HTMLLabel, context: Context) {
		if htmlText != label.htmlText {
			label.setHtml(htmlText, asynchronously: false)
		}
	}
}
