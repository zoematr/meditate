//
//  ContentView.swift
//  meditate
//
//  Created by Zoe Matrullo on 26/11/22.
//VERSION 2

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    VStack {
                        Text(" hi user")
                            .frame(width: 350, height: 30, alignment: .leading)
                            .font(.system(size: 32, weight: .heavy, design: .default))
                            .foregroundColor(CustomColor.darkgreen)
                            .background(CustomColor.cream)
                            .padding()
                        
                        Spacer()
                            .frame(height:200)
                        
                        Group {
                            NavigationLink("     meditate") {
                                StartSession()
                            }
                            .background(CustomColor.cream)
                            .foregroundColor(CustomColor.darkgreen)
                            .font(.system(size: 32, weight: .heavy, design: .default))
                            
                            Spacer()
                                .frame(height:100)
                            
                            NavigationLink("     my journey") {
                                CalendarView()
                            }
                            .background(CustomColor.cream)
                            .foregroundColor(CustomColor.darkgreen)
                            .font(.system(size: 32, weight: .heavy, design: .default))
                            
                            Spacer()
                                .frame(height: 30)
                            
                        }.frame(maxHeight: .infinity, alignment: .bottom)
                    }.frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading
                      ).background(CustomColor.cream)
                }
            } else {
                // Fallback on earlier versions
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomColor {
    static let lightgreen = Color("lightgreen")
    static let darkgreen = Color("darkgreen")
    static let mediumgreen = Color("mediumgreen")
    static let cream = Color("cream")
    static let beige = Color("beige")
    static let brown = Color("brown")
}

