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
                .renderingMode(.template)
                .foregroundColor(.white)
                .padding(12)
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
                .foregroundColor(Color.white)
            Spacer()
            Image("ic_search-normal")
                .renderingMode(.template)
                .foregroundColor(.white)
        }
        .padding(12)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(.white, lineWidth: 2)
        }
        .onChange(of: searchText, perform: onSearch)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            NavBar{ _ in
                
            } onMenuOpen: {
                
            }
            Spacer()
        }
        .padding()
        .background(Color.black)
    }
}
