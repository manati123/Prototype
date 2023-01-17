//
//  CredentialsView.swift
//  InternshipTinder
//
//  Created by Silviu Preoteasa on 16.01.2023.
//

import SwiftUI

struct CredentialsView: View {
    @Binding var email: String
    @Binding var password: String
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .shadow(radius: 5.0)
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .shadow(radius: 5.0)
                .autocapitalization(.none)
        }.padding(.horizontal, 20)
    }
}

struct CredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsView(email: .constant(""), password: .constant(""))
    }
}
