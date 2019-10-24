//
//  HTMLLabel.swift
//  UIKitExample
//
//  Created by Martin Skrovina on 10/14/19.
//  Copyright © 2019 Skrovina. All rights reserved.
//

import Foundation
import UIKit

class HTMLLabel: UIView {
	private let label: UILabel
	private(set) var htmlText: String

	// designated initializer
	override init(frame: CGRect) {
		self.label = UILabel()
		self.htmlText = ""
		super.init(frame: frame)
		setUp()
	}
	// for storyboard use
	required init?(coder: NSCoder) {
		self.label = UILabel()
		self.htmlText = ""
		super.init(coder: coder)
		setUp()
	}

	convenience init() {
		self.init(frame: .zero)
	}

	func setUp() {
		label.numberOfLines = 0
		label.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		label.frame = self.bounds

		label.attributedText = NSAttributedString()
		self.addSubview(label)
	}

	func setHtml(_ htmlString: String, asynchronously: Bool) {
		self.htmlText = htmlString

		let stringSetter = {
			guard let data = htmlString.data(using: String.Encoding.utf16, allowLossyConversion: false) else {
				return
			}

			guard let attributedString = try? NSAttributedString(data: data,
																 options: [
																	.documentType: NSAttributedString.DocumentType.html,
																	.characterEncoding: String.Encoding.utf16.rawValue],
																 documentAttributes: nil) else {
																	return
			}

			self.label.attributedText = attributedString
		}

		if asynchronously {
			DispatchQueue.main.async {
				stringSetter()
			}
		} else {
			stringSetter()
		}
	}

}
