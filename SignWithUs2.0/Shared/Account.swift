//
//  Account.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/7/21.
//

import SwiftUI

struct Account: View {
    @Binding var firstname: String
    @Binding var lastname: String
    @Binding var username: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var street1: String
    @Binding var street2: String
    @Binding var city: String
    @Binding var state: String
    @Binding var zip: String
    @State private var showActionSheet = false
    
    private func isUserInformationValid() -> Bool {
        if firstname.isEmpty {
            return false
        }
        if lastname.isEmpty {
            return false
        }
        if email.isEmpty {
            return false
        }
        if phone.isEmpty {
            return false
        }
        if street1.isEmpty {
            return false
        }
        if street2.isEmpty {
            return false
        }
        if city.isEmpty {
            return false
        }
        if state.isEmpty {
            return false
        }
        if zip.isEmpty {
            return false
        }
        
        return true
    }
    
    var body: some View {
        VStack{
            Form {
                Section(header: Text("Login")) {
                    TextField("Username", text: $username).textContentType(.username)
                    SecureField("Password", text: .constant(""))
                }
                Section(header: Text("Contact Info")) {
                    TextField("First Name", text: $firstname).textContentType(.givenName)
                    TextField("Last Name", text: $lastname).textContentType(.familyName)
                    TextField("Email", text: $email).textContentType(.emailAddress)
                    TextField("Phone", text: $phone).textContentType(.telephoneNumber)}
                Section(header: Text("Address")) {
                    TextField("Street Line 1", text: $street1).textContentType(.streetAddressLine1)
                    TextField("Street Line 2", text: $street2).textContentType(.streetAddressLine2)
                    TextField("City", text: $city).textContentType(.addressCity)
                    TextField("State", text: $state).textContentType(.addressState)
                    TextField("Zip", text: $zip).textContentType(.postalCode)}
                if self.isUserInformationValid() {
                    Button(action: {
                        showActionSheet = true
                    }, label: {
                        Text("Update Profile").foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    })
                    .actionSheet(isPresented: $showActionSheet){
                        ActionSheet(title: Text("Confirm Account Changes"),
                                            message: Text("These changes will be permanent."),
                                            buttons: [
                                                .cancel(),
                                                .destructive(
                                                    Text("Confirm")
                                                )
                                                //.default(
                                                    //Text("Append to //Current Workout"),
                                                   // action: appendWorkout
                                                //)
                                            ]
                                )
                    }
                }
            }
            
            
            
        }.navigationBarTitle("Account", displayMode: .inline)
        
        
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account(firstname: .constant(""),
                lastname: .constant(""),
                username: .constant(""),
                email: .constant(""),
                phone: .constant(""),
                street1: .constant(""),
                street2: .constant(""),
                city: .constant(""),
                state: .constant(""),
                zip: .constant(""))
    }
}

/*
 // Create the AlertController and add its actions like button in ActionSheet
 let actionSheetController = UIAlertController(title: nil, message: "Are you sure you want to update your account?", preferredStyle: .actionSheet)

 let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
     print("Cancel")
 }
 
 actionSheetController.addAction(cancelActionButton)

 let saveActionButton = UIAlertAction(title: "Save", style: .default) { action -> Void in
     print("Save")
 }
 actionSheetController.addAction(saveActionButton)
 
 
 
 self.present(actionSheetController, animated: true, completion: nil)
 */
