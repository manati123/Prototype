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

struct MainCoordinatorView: View {
    @State var selection: MainCoordinatorDestinationEnum? = .mainScreen
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: MainScreenView()) {
                    
                }
            }
        }
    }
}
