//
//  Movies.swift
//  MoviesApp
//
//  Created by Aljwhra Alnasser on 18/11/2023.
//

import SwiftUI

struct Movies: View , Identifiable {
    
    var id = UUID()
    var imageMove: String
    var title: String
    var releaseYear: Int
    
    var body: some View {
        VStack{
            
            Image(imageMove)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200 , height: 150)
            
            Text(title)
                .font(.headline)
                .bold()
                .multilineTextAlignment(.center)
                
            Text(String(releaseYear))
                .font(.caption)
            
                
            
        }
        .foregroundColor(.white)
    }
}

#Preview {
    Movies(imageMove: "Movie1", title: "JOKER", releaseYear: 2019)
}
