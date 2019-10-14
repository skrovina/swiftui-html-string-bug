//
//  HTML_LabelTests.swift
//  HTML-LabelTests
//
//  Created by Martin Skrovina on 10/14/19.
//  Copyright © 2019 Skrovina. All rights reserved.
//

import XCTest
@testable import HTML_Label
import Foundation

class HTML_LabelTests: XCTestCase {

    func testExample() {
		let html = "1234"
		guard let data = html.data(using: String.Encoding.utf16, allowLossyConversion: false) else {
			XCTFail("Data encoding")
			return
		}

		guard let attributedString = try?  NSAttributedString(data: data,
															  options: [
																.documentType: NSAttributedString.DocumentType.html,
																.characterEncoding: String.Encoding.utf16.rawValue],
															  documentAttributes: nil) else {
																XCTFail("Attr. str. initialization")
																return
		}

		print("--------")
		print(attributedString.string)
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
	}
}
