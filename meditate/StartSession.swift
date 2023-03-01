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
    @State private var minutesInput = 10
    @State private var backgroundColor = RadialGradient(colors: [CustomColor.cream, CustomColor.cream, CustomColor.cream], center: .center, startRadius: 0 ,endRadius: 10)
    @State private var animatedCircleColor = CustomColor.cream
    @State private var animatedCircleRadius: CGFloat = 10
    @EnvironmentObject var meditationData: MeditationData
    @State var finalTime = 0
    
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
                        .zIndex(1)
                    Button(action: {
                        timer?.invalidate()
                        timer = nil
                        timeRemaining = 0
                        isTimerRunning = false
                        animatedCircleColor = CustomColor.cream.opacity(0)
                        animatedCircleRadius = 0
                        withAnimation {backgroundColor = RadialGradient(colors: [CustomColor.cream, CustomColor.cream, CustomColor.cream],
                                                                        center: .center, startRadius: 0 ,endRadius: 10)
                        }
                    }) //end of action button
                    {
                    Text("Stop")
                        .foregroundColor(CustomColor.mediumgreen)
                        .font(.system(size: 32, weight: .heavy, design: .default))
                        .padding()
                    }
                } else {
                    //view where you can set the timer
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
                            }//end of if
                        }) //end of action buttonbn
                        {Text("+")
                                .foregroundColor(CustomColor.darkgreen)
                                .font(.system(size: 32, weight: .heavy, design: .default))
                                .padding()
                        }
                        Button(action: {
                            if minutesInput != 0 {
                                minutesInput -= 1
                            }//end of if
                        }) //end of action button
                        {Text("-")
                                .foregroundColor(CustomColor.darkgreen)
                                .font(.system(size: 32, weight: .heavy, design: .default))
                                .padding()
                        }
                    }// END HStack
                    //still in the else
                    Button(action: { //start button to swith to countdown view
                        if minutesInput != 0 {
                            timeRemaining = minutesInput * 60
                            finalTime = timeRemaining
                            isTimerRunning = true
                            animatedCircleColor = CustomColor.beige //HERE CHANGE CIRCLE C0LOR
                            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
                            { _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                    if animatedCircleRadius < 900 {
                                        withAnimation{
                                            animatedCircleRadius += 8
                                        }
                                    }
                                    else {
                                        animatedCircleRadius = 10
                                    }
                                } else {
                                    timer?.invalidate()
                                    timer = nil
                                    isTimerRunning = false
                                    backgroundColor = RadialGradient(colors: [CustomColor.cream, CustomColor.cream, CustomColor.cream], center: .center, startRadius: 0, endRadius: 10)
                                    animatedCircleColor = CustomColor.cream
                                    animatedCircleRadius = 0
                                    saveSession() //ONLY IF THE TIME EXPIRES I CALL saveSession() ????
                                }
                            } //end if _in
                            withAnimation(.easeInOut){ //still in the action of the button
                                backgroundColor = RadialGradient(colors: [CustomColor.cream,CustomColor.cream,CustomColor.cream,CustomColor.lightgreen,CustomColor.lightgreen,CustomColor.lightgreen, CustomColor.mediumgreen,CustomColor.mediumgreen, CustomColor.mediumgreen], center: .center, startRadius: 0, endRadius: 400)
                            }//end animation
                        }//end of if minutesInput != 0, condition for which the action is executed
                    }) //end of action
                    {Text("Start")
                            .foregroundColor(CustomColor.darkgreen)
                            .font(.system(size: 32, weight: .heavy, design: .default))
                            .padding()
                    }
                }//end of VStack
                Spacer()
            }.zIndex(1) //end of VStack
            .padding()
            Circle()
                .stroke(animatedCircleColor, lineWidth: 100)
                .frame(width: animatedCircleRadius, height: animatedCircleRadius)
                .blur(radius: 50)
        }
        //end of ZStack
    } //end of body
    
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
    }//end of startTimer
    
    func saveSession() {
        print("test")
        print(finalTime)
        let session = MeditationSession(date: Date(), durationInMinutes: finalTime) //FIXXXX
        meditationData.isSession(session: session)  //PROBLEM
    }//end of saveSession
}//end of view
        
struct StartSession_Previews: PreviewProvider {
    static var previews: some View {
        StartSession()
    }
}
