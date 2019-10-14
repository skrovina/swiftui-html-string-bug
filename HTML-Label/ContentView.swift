//
//  ContentView.swift
//  HTML-Label
//
//  Created by Martin Skrovina on 10/14/19.
//  Copyright © 2019 Skrovina. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State var html = "12<b>34</b>3456"

    var body: some View {
		VStack {
			Text("Hello World")
			HTMLText(html)
		}.onAppear(perform: {
			DispatchQueue.main.asyncAfter(deadline: DispatchTime.now().advanced(by: .seconds(5))) {
				self.html = "12<b>34</b>3456<b>789</b>10"
			}
		})
	}
}
