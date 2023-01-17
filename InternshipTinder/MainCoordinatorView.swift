//
//  MainCoordinatorView.swift
//  InternshipTinder
//
//  Created by Preoteasa Ioan-Silviu on 15.01.2023.
//

import SwiftUI

enum MainCoordinatorDestinationEnum: String {
    case mainScreen, login, signUp, userDetails
}

extension UserDefaults {

    func valueExists(forKey key: String) -> Bool {
        return object(forKey: key) != nil
    }

}

struct MainCoordinatorView: View {
    @State var selection: MainCoordinatorDestinationEnum? = .signUp
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: LoginView(onFinish: {selection = .mainScreen}).navigationBarHidden(true), tag: MainCoordinatorDestinationEnum.login, selection: $selection) {
                    EmptyView()
                }.transition(.slide.animation(.default))
                    .navigationBarHidden(true)
                NavigationLink(destination: SignUpView(onFinish: {selection = .login}).navigationBarHidden(true), tag: MainCoordinatorDestinationEnum.signUp, selection: $selection) {
                    EmptyView()
                }.transition(.slide.animation(.default))
                    .navigationBarHidden(true)
                NavigationLink(destination: MainScreenView(onFinish: {selection = .login}).navigationBarHidden(true), tag: MainCoordinatorDestinationEnum.mainScreen, selection: $selection) {
                    EmptyView()
                }.transition(.slide.animation(.default))
                    .navigationBarHidden(true)
            }
        }.navigationBarHidden(true)
            .onAppear {
                print(UserDefaults.standard.valueExists(forKey: "isRecruiter"))
                if UserDefaults.standard.valueExists(forKey: "isRecruiter") == true {
                    selection = .mainScreen
                } else {
                    selection = .signUp
                }
            }
    }
}
