//
//  MovieCard.swift
//  iTheat
//
//  Created by Samy Mehdid on 28/5/2023.
//

import SwiftUI

struct MovieCard: View {
    
    let movie: Movie
    @State var isAtFront: Bool
    
    var body: some View {
        VStack{
            Image(movie.image)
                .resizable()
                .frame(width: 100, height: 200)
                .cornerRadius(16)
            
            if isAtFront {
                Text(movie.name)
            }
        }
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: Movie(name: "heho", image: "heho.com"), isAtFront: true)
    }
}
