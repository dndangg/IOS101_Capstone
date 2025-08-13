//
//  ContentView.swift
//  EaseScore
//
//  Created by Dylan Dang on 8/6/25.
//


import SwiftUI

let NAMES_BY_EVENT: [String: [String]] = [
    "Dance Competition Finals": [
        "Ava Martinez", "Liam Nguyen", "Sophia Patel", "Noah Johnson", "Isabella Garcia",
        "Mason Lee", "Mia Rodriguez", "Elijah Brown", "Amelia Davis", "Lucas Wilson"
    ],
    "Art Showcase 2025": [
        "Harper Kim", "Ethan Thompson", "Ella Perez", "Benjamin Clark", "Aria Rivera",
        "James Walker", "Scarlett Hall", "Henry Adams", "Victoria Torres", "Jack Campbell"
    ],
    "Science Fair Judging": [
        "Olivia Brooks", "Alexander Flores", "Charlotte Sanders", "Michael Murphy", "Abigail Ward",
        "Daniel Cox", "Emily Peterson", "Matthew Bell", "Chloe Bailey", "William Cooper"
    ]
]

struct ContentView: View {
    @State private var selectedEvent: String?

    var body: some View {
        NavigationStack {
            List {
                Section("Select an Event") {
                    NavigationLink("Dance Competition Finals") {
                        ParticipantListView(eventName: "Dance Competition Finals")
                    }
                    NavigationLink("Art Showcase 2025") {
                        ParticipantListView(eventName: "Art Showcase 2025")
                    }
                    NavigationLink("Science Fair Judging") {
                        ParticipantListView(eventName: "Science Fair Judging")
                    }
                }
            }
            .navigationTitle("Events")
        }
    }
}

struct ParticipantListView: View {
    let eventName: String

    private var participants: [(id: Int, name: String)] {
        let names = NAMES_BY_EVENT[eventName] ?? []
        return Array(1...10).enumerated().map { index, id in
            let safeName = index < names.count ? names[index] : "Participant \(id)"
            return (id: id, name: safeName)
        }
    }

    var body: some View {
        List {
            Section("Participants") {
                ForEach(participants, id: \.id) { p in
                    NavigationLink("\(p.id) - \(p.name)") {
                        ScoringView(eventName: eventName, participantID: p.id, participantName: p.name)
                    }
                }
            }
        }
        .navigationTitle("Participants")
        .toolbar {
            NavigationLink("Results") {
                ResultsView(eventName: eventName)
            }
        }
    }
}

struct ResultsView: View {
    let eventName: String

    private var participants: [(id: Int, name: String, total: Int)] {
        let names = NAMES_BY_EVENT[eventName] ?? []
        return Array(1...10).map { id in
            let name = id-1 < names.count ? names[id-1] : "Participant \(id)"
            let total = 24 + (id % 7) // sample total 24–30
            return (id: id, name: name, total: total)
        }
        .sorted { $0.total > $1.total }
    }

    var body: some View {
        List {
            Section("Leaderboard") {
                ForEach(Array(participants.enumerated()), id: \.element.id) { index, p in
                    HStack {
                        Text("\(index + 1).")
                            .frame(width: 28, alignment: .trailing)
                        VStack(alignment: .leading) {
                            Text(p.name)
                            Text("ID: \(p.id)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text("\(p.total)")
                            .bold()
                    }
                }
            }
        }
        .navigationTitle("Results")
    }
}

struct ScoringView: View {
    let eventName: String
    let participantID: Int
    let participantName: String

    @State private var artistic: Double = 5
    @State private var technical: Double = 5
    @State private var presence: Double = 5
    @State private var didSubmit = false

    var body: some View {
        Form {
            Section(header: Text("Event")) {
                Text(eventName)
            }

            Section(header: Text("Participant")) {
                Text("\(participantID) - \(participantName)")
            }

            Section(header: Text("Scores (1–10)")) {
                VStack(alignment: .leading, spacing: 12) {
                    VStack(alignment: .leading) {
                        Text("Artistic: \(Int(artistic))")
                        Slider(value: $artistic, in: 1...10, step: 1)
                    }
                    VStack(alignment: .leading) {
                        Text("Technical: \(Int(technical))")
                        Slider(value: $technical, in: 1...10, step: 1)
                    }
                    VStack(alignment: .leading) {
                        Text("Stage Presence: \(Int(presence))")
                        Slider(value: $presence, in: 1...10, step: 1)
                    }
                }
            }

            Section {
                Button("Submit Score") {
                    didSubmit = true
                }
            }

            if didSubmit {
                Section {
                    Text("✅ Score submitted!")
                }
            }
        }
        .navigationTitle("Scoring")
    }
}

#Preview {
    NavigationStack { ContentView() }
}
