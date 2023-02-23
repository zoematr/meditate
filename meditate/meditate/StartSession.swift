//
//  StartSession.swift
//  meditate
//
//  Created by Zoe Matrullo on 26/11/22.
//VERSION 2

import SwiftUI

struct StartSession: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [CustomColor.cream, CustomColor.cream, CustomColor.cream]),
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("start session")
                    .frame(width: 350, height: 30, alignment: .leading)
                    .font(.system(size: 38, weight: .heavy, design: .default))
                    .foregroundColor(CustomColor.darkgreen)
                    .padding()
            }
        }
    }
}

struct StartSession_Previews: PreviewProvider {
    static var previews: some View {
        StartSession()
    }
}

