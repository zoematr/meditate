//
//  CalendarView.swift
//  meditate
//
//  Created by Zoe Matrullo on 27/11/22.
//

import SwiftUI

import SwiftUI

struct CalendarView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [CustomColor.cream, CustomColor.cream, CustomColor.cream]),
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            VStack{
                VStack {
                    Text("my journey")
                        .frame(width: 350, height: 30, alignment: .leading)
                        .font(.system(size: 32, weight: .heavy, design: .default))
                        .foregroundColor(CustomColor.darkgreen)
                        .background(CustomColor.cream)
                        .padding()
                    Spacer()
                    CalendarModuleView()
                    Spacer()
                }
                VStack {
                    Spacer()
                    Text("details")
                        .frame(width: 350, height: 30)
                        .font(.system(size: 32, weight: .heavy, design: .default))
                        .foregroundColor(CustomColor.darkgreen)
                        .background(CustomColor.cream)
                        .padding()
                    Spacer()
                }
            }
        }
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

