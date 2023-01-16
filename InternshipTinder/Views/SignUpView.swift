//
//  SignUpView.swift
//  InternshipTinder
//
//  Created by Silviu Preoteasa on 16.01.2023.
//

import SwiftUI

struct SignUpView: View {
    let onFinish: () -> Void
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(Font.largeTitle)
                .padding(.top, 10)
            Spacer()
            CredentialsView(email: $email, password: $password)
            Spacer()
            Button {
                onFinish()
            } label: {
                Text("Sign Up")
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


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(onFinish: {})
    }
}
