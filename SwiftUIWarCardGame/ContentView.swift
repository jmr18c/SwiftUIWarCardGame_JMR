//
//  ContentView.swift
//  SwiftUIWarCardGame
//
//  Created by Justin Raitz on 11/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randNum1 = 2
    @State private var randNum2 = 5
    
    @State private var score1 = 0
    @State private var score2 = 0
    
    var body: some View {
        
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
            VStack {
                
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack {
                    Image("card\(randNum1)")
                    Image("card\(randNum2)")
                }
                
                Spacer()
            
                Button(action: {
                    // Randomize state properties that correspond w/ number of card image to show
                    self.randNum1 = Int.random(in: 2...14)
                    self.randNum2 = Int.random(in: 2...14)
                    
                    // Update scores based on card values
                    if self.randNum1 > self.randNum2 {
                        score1 += 1
                    }
                    if self.randNum2 > self.randNum1 {
                        score2 += 1
                    }
                }, label: {
                    Image("dealbutton")
                })
                
                Spacer()
                
                Button(action: {
                    // Randomize state properties that correspond w/ number of card image to show
                    score1 = 0
                    score2 = 0
                }, label: {
                    Text("RESET")
                        .bold()
                        .foregroundColor(.white)
                })
                
                HStack {
                    VStack {
                        Text("Player")
                            .bold()
                        Text("\(score1)")
                    }
                    .padding(.leading, 100)
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU")
                            .bold()
                        Text("\(score2)")
                    }
                    .padding(.trailing, 100)
                    .foregroundColor(.white)
                    
                }
                
                Spacer()
                
            }
        }
        
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
