//
//  StartSession.swift
//  meditate
//
//  Created by Zoe Matrullo on 26/11/22.
//VERSION 2

import SwiftUI

struct StartSession: View {
    @State private var timeRemaining = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var minutesInput = 0
    @State private var backgroundColor = CustomColor.cream
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            VStack {
                if isTimerRunning {
                    Spacer()
                    Text("\(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                        .foregroundColor(CustomColor.darkgreen)
                        .font(.system(size: 70, weight: .medium, design: .default))
                        .padding()
                    Button(action: {
                        timer?.invalidate()
                        timer = nil
                        timeRemaining = 0
                        isTimerRunning = false
                        withAnimation {backgroundColor = CustomColor.cream}
                    })  {
                        Text("Stop")
                            .foregroundColor(CustomColor.brown)
                            .font(.system(size: 32, weight: .heavy, design: .default))
                            .foregroundColor(CustomColor.darkgreen)
                            .padding()
                    }
                }
                else {
                    Spacer()
                    Text("\(minutesInput)")
                        .foregroundColor(CustomColor.darkgreen)
                        .font(.system(size: 70, weight: .heavy, design: .default))
                    Text(" minutes")
                        .foregroundColor(CustomColor.darkgreen)
                        .font(.system(size: 30, weight: .semibold, design: .default))
                    HStack {
                        Button(action: {
                            if minutesInput < 120 {
                                minutesInput += 1
                            } })
                        {Text("+")
                                .foregroundColor(CustomColor.darkgreen)
                                .font(.system(size: 32, weight: .heavy, design: .default))
                                .padding()
                        }
                        Button(action: {
                            if minutesInput != 0 {minutesInput -= 1}}) {Text("-")
                                    .foregroundColor(CustomColor.darkgreen)
                                    .font(.system(size: 32, weight: .heavy, design: .default))
                                    .padding()
                            }
                    } // HStack
                    
                    //still in the else
                    Button(action: {
                        if minutesInput != 0 {
                        timeRemaining = minutesInput * 60
                        isTimerRunning = true
                        //AnimatedBackground().edgesIgnoringSafeArea(.all).blur(radius: 50)
                        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            } else {
                                timer?.invalidate()
                                timer = nil
                                isTimerRunning = false
                                backgroundColor = CustomColor.cream
                            }
                        }
                        withAnimation {backgroundColor = CustomColor.lightgreen}
                    }}) {Text("Start")
                            .foregroundColor(CustomColor.darkgreen)
                            .font(.system(size: 32, weight: .heavy, design: .default))
                        .padding()}
                } //end of VStack
                Spacer()
            }
            .padding()
            .background(backgroundColor)
        }
    }
        
        func startTimer() {
            isTimerRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timer?.invalidate()
                    timer = nil
                    isTimerRunning = false
                }
            }
        }
        
        
        struct StartSession_Previews: PreviewProvider {
            static var previews: some View {
                StartSession()
            }
        }
    }

/*struct AnimatedBackground: View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [CustomColor.darkgreen, CustomColor.lightgreen, CustomColor.mediumgreen, CustomColor.cream, CustomColor.brown]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .animation(Animation.easeInOut(duration: 6).repeatForever())
            .onReceive(timer, perform: { _ in
                
                self.start = UnitPoint(x: 4, y: 0)
                self.end = UnitPoint(x: 0, y: 2)
                self.start = UnitPoint(x: -4, y: 20)
                self.start = UnitPoint(x: 4, y: 0)
            })
    }
}*/
