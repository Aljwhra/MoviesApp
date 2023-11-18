//
//  ContentView.swift
//  MoviesApp
//
//  Created by Aljwhra Alnasser on 18/11/2023.

import SwiftUI

struct ContentView: View {
    
    @State private var currentindex: Int = 0
    
        var imges = [
            Main_Card(image: "Frame1"),
            Main_Card(image: "Frame2"),
            Main_Card(image: "Frame3")
    
        ]
    
    
    
    @State private var moviesArray: [Movies] = [
        Movies(imageMove: "Movie1", title: "JOKER", releaseYear: 2019),
        Movies(imageMove: "Movie2", title: "House Dragon", releaseYear: 2021),
        Movies(imageMove: "Movie3", title: "INCEPTION", releaseYear: 2018),
        Movies(imageMove: "Movie4", title: "Suicide Squad", releaseYear: 2019),
        Movies(imageMove: "Movie5", title: "Star Wars", releaseYear: 2016),
        Movies(imageMove: "Movie6", title: "X", releaseYear: 2023)
    ]

    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3) // 3 columns

    var body: some View {
        ZStack {
            Color.color1
                .ignoresSafeArea()

            VStack {
                
                
                ScrollView(.init()){
                    TabView(selection: $currentindex){
                        
                        ForEach(imges.indices,id: \.self) { index in
                            
                            imges[index]
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .overlay(
                            HStack{
                                ForEach(imges.indices, id: \.self){ index in
                                    let isCurrentPage: Bool = currentindex == index
                                    Capsule()
                                        .fill(isCurrentPage ? Color.white : Color.gray)
                                        .frame(width: isCurrentPage ? 30 : 5,height: 6)
                                        .animation(.interactiveSpring(response: 0.5),value: isCurrentPage)
                                }
                            }
                                .padding(.top,245)
                        )
                   

                       
                }// ScrollView:

                HStack(spacing: 130){
                    Button("Olde") {
                        // Sort the movies from oldest to newest based on release year
                        moviesArray.sort { $0.releaseYear < $1.releaseYear }
                    }
                    .foregroundColor(.white)
                    .background(buttnSteyl())
                   

                    Button("Newe") {
                       
                        // Sort the movies from newest to oldest based on release year
                        moviesArray.sort { $0.releaseYear > $1.releaseYear }
                        
                    }
                    .foregroundColor(.white)
                    .background( buttnSteyl())
                   
                   
                    
                   
                } .padding(.bottom)
                

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(moviesArray) { movie in
                            movie
                        }
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}



struct buttnSteyl: View {
    var body: some View {
        
        
        Rectangle()
        .fill(.clear)
        .background(
            
                LinearGradient(
                  stops: [
                    Gradient.Stop(color: Color(red: 0.53, green: 0.48, blue: 0.82), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.42, green: 0.38, blue: 0.69), location: 1.00),
                  ],
                  startPoint: UnitPoint(x: 0.5, y: 0),
                  endPoint: UnitPoint(x: 0.5, y: 1)
                )
              
              .cornerRadius(10)
              .shadow(color: Color(red: 0.3, green: 0.26, blue: 0.54).opacity(0.15), radius: 7.5, x: 0, y: 5)
            
        )
        .frame(width: 129, height: 47)
    }
}
    

