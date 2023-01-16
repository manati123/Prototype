//
//  LoginView.swift
//  InternshipTinder
//
//  Created by Preoteasa Ioan-Silviu on 15.01.2023.
//

import SwiftUI

struct LoginUser {
    enum UserType: String {
        case student, recruiter
    }
    var email: String
    var password: String
    
}

class LoginViewModel: ObservableObject {
    @Published var user: LoginUser = .init(email: "", password: "")
    
    func checkCredentials(onFinishStudent: () -> Void, onFinishRecruiter: () -> Void) {
        if user.email == "student@test.dev" {
            onFinishStudent()
            UserDefaults.standard.set(false, forKey: "isRecruiter")
        } else if user.email == "recruiter@test.dev" {
            onFinishRecruiter()
            UserDefaults.standard.set(true, forKey: "isRecruiter")
        }
    }
}
struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = .init()
    
    let onFinishStudent: () -> Void
    let onFinishRecruiter: () -> Void
    
    var body: some View {
        VStack {
            Text("Login")
                .font(Font.largeTitle)
                .padding(.top, 10)
            Spacer()
            CredentialsView(email: $viewModel.user.email, password: $viewModel.user.password)
            Spacer()
            Button {
                viewModel.checkCredentials(onFinishStudent: onFinishStudent, onFinishRecruiter: onFinishRecruiter)
            } label: {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 5.0)
            }
            Spacer()
        }
    }
}
