//
//  ContentView.swift
//  HCI Project
//
//  Created by Christina Ye on 11/5/21.
//

import Foundation
import SwiftUI

struct UserSignUp: View {
    @Binding var currpage: String
    @State var username: String = ""
    @State var password: String = ""
    @State var emailid: String = ""
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Text("Sign Up")
                    .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    .padding().font(.largeTitle)
                Spacer()
            }
            
            TextField("Username", text: $username).padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("Email ID", text: $emailid).padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password).padding().cornerRadius(5.0).padding(.bottom, 20)
            
            Spacer()
            Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 320, height: 60)
                        .background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                        .cornerRadius(15.0)
            Spacer()
            HStack{
                Spacer()
                Button {
                    currpage = "Login"
                } label: {
                Text("Already have an account? Sign In")
                    .font(.headline)
                    .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    .padding()
                }
                Spacer()
            }
            
        }.padding()
            
            
        
    }
    
}

struct UserSignUp_Previews: PreviewProvider {
    static var previews: some View {
        UserSignUp(currpage: .constant("SignUp"))
    }
}
