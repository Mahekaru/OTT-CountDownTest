//
//  ContentView.swift
//  CountDownTest
//
//  Created by Michael Jennings on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            AnniversaryView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
