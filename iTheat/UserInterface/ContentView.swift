//
//  ContentView.swift
//  iTheat
//
//  Created by Samy Mehdid on 27/5/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavBar { search in
                // search api
            } onMenuOpen: {
                // open menu
            }
            Spacer()
        }
        .padding()
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
