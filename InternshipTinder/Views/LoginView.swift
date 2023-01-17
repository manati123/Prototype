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
    
    func checkCredentials(onFinish: () -> Void) {
        if user.email == "student@test.dev" && user.email.count > 8 {
            UserDefaults.standard.set(false, forKey: "isRecruiter")
            onFinish()
        } else if user.email == "recruiter@test.dev" && user.email.count > 8{
            UserDefaults.standard.set(true, forKey: "isRecruiter")
            onFinish()
        } else {
            ErrorHandler.errorHandler.showError(message: "Wrong credentials")
        }
    }
}
struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = .init()
    
    let onFinish: () -> Void
    
    var body: some View {
        VStack {
            Text("Login")
                .font(Font.largeTitle)
                .padding(.top, 10)
            Spacer()
            CredentialsView(email: $viewModel.user.email, password: $viewModel.user.password)
            Spacer()
            Button {
                viewModel.checkCredentials(onFinish: onFinish)
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
