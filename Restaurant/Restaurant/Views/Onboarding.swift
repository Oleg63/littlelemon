//
//  Onboarding.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-08-31.
//

import SwiftUI

public let kAvatarImage = "avatar image"
public let kFirstName = "first name key"
public let kLastName = "last name key"
public let kEmail = "email key"

public let kIsLoggedIn = "kIsLoggedIn" //store the login status

public let kPhoneNumber = "phone number key"
public let kOrderStatuses = "order statuses key"
public let kPasswordChanges = "password changes key"
public let kSpecialOffers = "special offers key"
public let kNewsletter = "news letter key"

struct Onboarding: View {
    @State var firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? "" //unwrap optional
    @State var lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State var email: String = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State var isLoggedIn: Bool = false
    @State var showingAlert: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn){
                    EmptyView()
                }
                HeaderView(showAvatar: false)
                HeroView(searchText: .constant(""), showSearch: false)
                Form {
                    Section("First Name *") {
                        TextField("First Name", text: $firstName)
                            .disableAutocorrection(true)
                    }
                    Section("Last Name *") {
                        TextField("Last Name", text: $lastName)
                            .disableAutocorrection(true)
                    }
                    Section("Email *") {
                        TextField("Email", text: $email)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                    }
                }
                Button {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        isLoggedIn = true
                        //storing the data in UserDefaults.standard
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                    } else {
                        showingAlert = true
                    }
                } label: {
                    Text("Login")
                        .padding()
                        .frame(width: 200)
                        .background(Color.primaryYellow)
                        .foregroundColor(.white)
                        .bold()
                        .cornerRadius(8)
                }
                Spacer()
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {//if user is logged in already
                    isLoggedIn = true
                } else {
                    firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
                    lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
                    email = UserDefaults.standard.string(forKey: kEmail) ?? ""
                }
            }
            .alert("Please fill in all requied fields!", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }    
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

