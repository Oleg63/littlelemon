//
//  UserProfile.swift
//  Restaurant
//
//  Created by Oleg Udovenko on 2023-08-31.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation //allow you to reach the navigation logic.

    @State var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? "" //unwrap optional
    @State var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State var phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    @State var avatarImage = UserDefaults.standard.string(forKey: kAvatarImage) ?? "Profile"
    
    @State var orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
    @State var passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
    @State var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
    @State var newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    
    @State private var isLoggedOut = false
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Button {
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
                            .foregroundColor(.white).background(Color.primaryGreen) .clipShape(Circle())
                    }
                    HeaderView(showAvatar: true)
                }
                HStack {
                    Text("Personal Information")
                        .font(.custom("Karla Bold", size: 18))
                    Spacer()
                }
                HStack {
                    Text("Avatar")
                        .font(.custom("Karla Bold", size: 12))
                        .foregroundColor(Color.highlightGreyVeryLight)
                    Spacer()
                }
                HStack {
                    Image(avatarImage)
                        .resizable()
                        .frame(width: 70, height: 70)
                    Button {
                        avatarImage = "Profile"
                    } label: {
                        Text("Change")
                            .padding(.all, 10)
                            .background(Color.primaryGreen)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .cornerRadius(8)
                    }

                    Button {
                        avatarImage = ""
                    } label: {
                        Text("Remove")
                            .padding(.all, 10)
                            .background(.white)
                            .foregroundColor(Color.highlightGreyVeryLight)
                            .border(Color.primaryGreen)
                            .lineLimit(1)
                    }
                }
                .padding(.leading, -100.0)
                .buttonStyle(BorderlessButtonStyle())
                
                VStack {
                    Text("First Name *")
                        .titleTextStyle()
                        .padding(.top, 6)
                    TextField("First Name", text: $firstName)
                        .disableAutocorrection(true)
                        .border(Color.highlightGreyLight)
                        .cornerRadius(8)
                        .frame(height: 30.0)
                }
                .textFieldStyle(.roundedBorder)
                
                VStack {
                    Text("Last Name *")
                        .titleTextStyle()
                        .padding(.top, 6)
                    TextField("Last Name", text: $lastName)
                        .disableAutocorrection(true)
                        .border(Color.highlightGreyLight)
                        .cornerRadius(8)
                        .frame(height: 30.0)
                }
                .textFieldStyle(.roundedBorder)
                
                VStack {
                    Text("Email *")
                        .titleTextStyle()
                        .padding(.top, 6)
                    TextField("Email", text: $email)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .border(Color.highlightGreyLight)
                        .cornerRadius(8)
                        .frame(height: 30.0)
                }
                .textFieldStyle(.roundedBorder)
                
                VStack {
                    Text("Phone number")
                        .titleTextStyle()
                        .padding(.top, 6)
                    TextField("Phone number", text: $phoneNumber)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .border(Color.highlightGreyLight)
                        .cornerRadius(8)
                        .frame(height: 30.0)
                }
                .textFieldStyle(.roundedBorder)
                
                HStack {
                    Text("Email notifications")
                        .font(.custom("Karla Bold", size: 18))
                        .padding(.top, 6)
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Toggle("", isOn: $orderStatuses)
                            .toggleStyle(ToggleCheckboxStyle())
                            .font(.title)
                        Text("Order Statuses")
                            .padding(.top, 0)
                        Spacer()
                    }
                    
                    HStack {
                        Toggle("", isOn: $passwordChanges)
                            .toggleStyle(ToggleCheckboxStyle())
                            .font(.title)
                        Text("Password Changes")
                            .padding(.top, 0)
                        Spacer()
                    }
                    
                    HStack {
                        Toggle("", isOn: $specialOffers)
                            .toggleStyle(ToggleCheckboxStyle())
                            .font(.title)
                        Text("Special offers")
                            .padding(.top, 0)
                        Spacer()
                    }
                    
                    HStack {
                        Toggle("", isOn: $newsletter)
                            .toggleStyle(ToggleCheckboxStyle())
                            .font(.title)
                        Text("Newsletter")
                            .padding(.top, 0)
                        Spacer()
                    }
                    
                }
                Button {
                    firstName = ""
                    lastName = ""
                    email = ""
                    phoneNumber = ""
                    orderStatuses = false
                    passwordChanges = false
                    specialOffers = false
                    newsletter = false
                    
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    UserDefaults.standard.set("", forKey: kFirstName)
                    UserDefaults.standard.set("", forKey: kLastName)
                    UserDefaults.standard.set("", forKey: kEmail)
                    UserDefaults.standard.set("", forKey: kPhoneNumber)
                    UserDefaults.standard.set(false, forKey: kOrderStatuses)
                    UserDefaults.standard.set(false, forKey: kPasswordChanges)
                    UserDefaults.standard.set(false, forKey: kSpecialOffers)
                    UserDefaults.standard.set(false, forKey: kNewsletter)
                    isLoggedOut = true
                    //self.presentation.wrappedValue.dismiss()//go back to the previous screen which is Onboarding - simulating logout.
                } label: {
                    HStack {
                        Spacer()
                        Text("Log out")
                        Spacer()
                    }
                    .padding(.all, 10)
                    .background(Color.primaryYellow)
                    .foregroundColor(.white)
                    .bold()
                    .cornerRadius(8)
                }
                
                HStack {
                    Button {
                        firstName = ""
                        lastName = ""
                        email = ""
                        phoneNumber = ""
                        orderStatuses = false
                        passwordChanges = false
                        specialOffers = false
                        newsletter = false
                    } label: {
                        Text("Discard changes")
                            .padding(.all, 10)
                            .foregroundColor(Color.highlightGreyVeryLight)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.primaryGreen, lineWidth: 1)
                            )
                    }
                    
                    Button {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                        
                        UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
                        UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                        UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                    } label: {
                        Text("Save changes")
                            .padding(.all, 10)
                            .background(Color.primaryGreen)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                Spacer()
            }
            .padding([.leading, .trailing], 20)
        }
    }
    
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
