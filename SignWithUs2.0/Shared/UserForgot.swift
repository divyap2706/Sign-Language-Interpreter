//
//  UserForgot.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 12/7/21.
//

import SwiftUI

struct UserForgot: View {
    @Binding var emailSent: String
    @Binding var currpage: String
    @Binding var username: String
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Text("Reset Password")
                    .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    .padding().font(.largeTitle)
                Spacer()
            }
            
            TextField("Email", text: $username).padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)

            Spacer()
            //NavigationLink(destination: ContentView()) {
            Button {
                emailSent = "Sent"
            } label: {
                Text("Reset Password")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 320, height: 60)
                            .background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                            .cornerRadius(15.0)
            }
            
            Button {
                emailSent = "Done"
            } label: {
                //"Return to Login Screen"
                Text("Cancel")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 320, height: 60)
                    .background(Color.gray)
                            .cornerRadius(15.0)
            }
            //}.navigationBarTitle("").navigationBarBackButtonHidden(true).navigationBarHidden(true)
            Spacer()
            
        }.padding()
    }
}

struct UserForgot_Previews: PreviewProvider {
    static var previews: some View {
        UserForgot(emailSent: .constant(""), currpage: .constant("Forgot"), username: .constant(""))
    }
}
