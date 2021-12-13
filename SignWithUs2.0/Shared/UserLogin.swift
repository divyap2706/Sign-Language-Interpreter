//
//  ContentView.swift
//  HCI Project
//
//  Created by Christina Ye on 11/5/21.
//

import Foundation
import SwiftUI

struct UserLogin: View {
    @Binding var showingHome: Bool
    @Binding var currpage: String
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        //NavigationView {
        VStack {
            Spacer()
            HStack{
                Text("Login")
                    .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    .padding().font(.largeTitle)
                Spacer()
            }
            
            TextField("Username", text: $username).padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password).padding().cornerRadius(5.0).padding(.bottom, 20)
            HStack{
                Spacer()
                Button {
                    currpage = "Forgot"
                } label: {
                    Text("Forgot Password?")
                        .font(.headline)
                        .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                        .padding()
                }
            }
            Spacer()
            //NavigationLink(destination: ContentView()) {
            Button {
                showingHome = true
            } label: {
                Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 320, height: 60)
                            .background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                            .cornerRadius(15.0)
            }

            //}.navigationBarTitle("").navigationBarBackButtonHidden(true).navigationBarHidden(true)
            Spacer()
            HStack{
                Spacer()
                Button {
                    currpage = "Signup"
                } label: {
                Text("Don't have an account? Sign Up")
                    .font(.headline)
                    .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    .padding()
                }
                Spacer()
            }
            
        }.padding()
            
            
        //}.navigationBarTitle("").navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
    
}

struct UserLogin_Previews: PreviewProvider {
    static var previews: some View {
        UserLogin(showingHome: .constant(false), currpage: .constant("Login"))
    }
}
