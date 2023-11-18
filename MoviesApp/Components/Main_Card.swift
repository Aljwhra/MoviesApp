//
//  Main_Card.swift
//  MoviesApp
//
//  Created by Aljwhra Alnasser on 18/11/2023.
//

import SwiftUI

struct Main_Card: View , Identifiable{
    
    var id = UUID()
    var image: String
    
    var body: some View {
        ZStack{
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 430)
                .frame(height: 400)
            
        }
    }
}

#Preview {
    Main_Card(image: "Frame1")
}
