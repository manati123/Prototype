//
//  MainScreenView.swift
//  InternshipTinder
//
//  Created by Preoteasa Ioan-Silviu on 15.01.2023.
//

import Foundation
import SwiftUI

struct MainScreenView: View {
    let onFinish: () -> Void
    let isRecruiter: Bool = UserDefaults.standard.bool(forKey: "isRecruiter")
    @State var students: [Student] = [
        Student(id: 0, name: "John Doe", education: "UBB", location: "Cluj", age: 23, imageName: "image"),
        Student(id: 1, name: "John Doe", education: "UBB", location: "Cluj", age: 27, imageName: "image"),
        Student(id: 2, name: "John Doe", education: "UBB", location: "Cluj", age: 27, imageName: "image"),
        Student(id: 3, name: "John Doe", education: "UBB", location: "Cluj", age: 27, imageName: "image"),
    ]
    
    @State var companies: [Company] = [
        Company(id: 0, name: "Tapptitude", description: "A mobile product company with attitude", imageName: "image"),
        Company(id: 1, name: "Tapptitude", description: "A mobile product company with attitude", imageName: "image"),
        Company(id: 2, name: "Tapptitude", description: "A mobile product company with attitude", imageName: "image"),
        Company(id: 3, name: "Tapptitude", description: "A mobile product company with attitude", imageName: "image"),
    ]
    
    /// Return the CardViews width for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(students.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
    /// Return the CardViews frame offset for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(students.count - 1 - id) * 10
    }
    
    private var maxID: Int {
        return self.students.map { $0.id }.max() ?? 0
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.8509803922, green: 0.6549019608, blue: 0.7803921569, alpha: 1)), Color.init(#colorLiteral(red: 1, green: 0.9882352941, blue: 0.862745098, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                    .frame(width: geometry.size.width * 1.5, height: geometry.size.height)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .offset(x: -geometry.size.width / 4, y: -geometry.size.height / 2)
                
                VStack(spacing: 24) {
                    DateView()
                    ZStack {
                        if isRecruiter == false {
                            companyCards(geometry: geometry)
                        } else {
                            studentCards(geometry: geometry)
                        }
                    }
                    Spacer()
                    Button {
                        UserDefaults.standard.removeObject(forKey: "isRecruiter")
                        onFinish()
                        
                    } label: {
                        Text("Log Out")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 5.0)
                }
            }
        }.padding()
    }
    
    @ViewBuilder
    func companyCards(geometry: GeometryProxy) -> some View {
        ForEach(self.companies, id: \.self) { company in
            Group {
                // Range Operator
                if (self.maxID - 3)...self.maxID ~= company.id {
                    CompanyCardView(company: company, onRemove: { removedCompany in
                        // Remove that user from our array
                        self.companies.removeAll { $0.id == removedCompany.id }
                    })
                    .animation(.spring())
                    .frame(width: self.getCardWidth(geometry, id: company.id), height: 400)
                    .offset(x: 0, y: self.getCardOffset(geometry, id: company.id))
                }
            }
        }//
    }
    
    @ViewBuilder
    func studentCards(geometry: GeometryProxy) -> some View {
        ForEach(self.students, id: \.self) { user in
            Group {
                // Range Operator
                if (self.maxID - 3)...self.maxID ~= user.id {
                    CardView(student: user, onRemove: { removedUser in
                        // Remove that user from our array
                        self.students.removeAll { $0.id == removedUser.id }
                    })
                    .animation(.spring())
                    .frame(width: self.getCardWidth(geometry, id: user.id), height: 400)
                    .offset(x: 0, y: self.getCardOffset(geometry, id: user.id))
                }
            }
        }//
    }
}

struct DateView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(Date.now.addingTimeInterval(600), style: .date)
                        .font(.title)
                        .bold()
                    Text("Today")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }.padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
