//
//  MeditationSession.swift
//  meditate
//
//  Created by Zoe Matrullo on 03/03/23.
//

import Foundation

struct MeditationSession: Identifiable {
    var id = UUID()
    var date: Date
    var durationInMinutes: Int
}

class MeditationData: ObservableObject {
    @Published var sessions: [MeditationSession] = []
    func isSession(session: MeditationSession) {
        sessions.append(session)
    }
}
