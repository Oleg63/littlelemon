//
//  Onboarding.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-08-31.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"

let kIsLoggedIn = "kIsLoggedIn" //store the login status

struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center){
                NavigationLink(destination: Home(), isActive: $isLoggedIn){
                    EmptyView() //.hidden()
                }
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                Button("Register", action: {
                    if firstName.isEmpty {
                        //alert
                    } else if lastName.isEmpty {
                        //alert
                    } else if email.isEmpty {
                        //if emailValid() dobavit vverxy
                        //alert
                    } else {
                        //storing the data in UserDefaults.standard
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        isLoggedIn = true
                        UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                    }
                })

            }
            //.padding(30)
            //.padding(30)
            //.padding(30)
            .buttonStyle(.bordered)
            .onAppear() {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {//if user is logged in already
                    isLoggedIn = true
                }
            }
            .navigationTitle("Onboarding")
            .navigationBarTitleDisplayMode(.inline)
        }

        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

