//
//  NavBar.swift
//  iTheat
//
//  Created by Samy Mehdid on 27/5/2023.
//

import SwiftUI

struct NavBar: View {
    
    @State private var searchText: String = ""
    
    var onSearch: (String) -> Void
    var onMenuOpen: () -> Void
    
    var body: some View {
        HStack{
            MenuButton()
            SearchBar()
        }
    }
    
    @ViewBuilder
    private func MenuButton() -> some View {
        Button(action: onMenuOpen){
            Image("ic_slider-vertical")
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.white, lineWidth: 2)
                }
        }
    }
    
    @ViewBuilder
    private func SearchBar() -> some View {
        HStack{
            TextField("Search movies", text: $searchText)
            Spacer()
            Image("ic_search-normal")
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(.white, lineWidth: 2)
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar{ _ in
            
        } onMenuOpen: {
            
        }
    }
}
