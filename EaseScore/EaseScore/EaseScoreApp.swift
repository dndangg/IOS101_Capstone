//
//  EaseScoreApp.swift
//  EaseScore
//
//  Created by Dylan Dang on 8/6/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var loginError = false

    let sampleEmail = "Alex@judging.com"
    let samplePassword = "password123"

    var body: some View {
        if isLoggedIn {
            ContentView()
        } else {
            VStack(spacing: 20) {
                Text("EaseScore")
                    .font(.title)
                    .foregroundColor(.blue)
                
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                if loginError {
                    Text("Invalid credentials")
                        .foregroundColor(.red)
                }
                Button("Login") {
                    if email == sampleEmail && password == samplePassword {
                        isLoggedIn = true
                    } else {
                        loginError = true
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
        }
    }
}

@main
struct EaseScoreApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
