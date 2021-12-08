//
//  PassResetSent.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 12/7/21.
//

import SwiftUI

struct PassResetSent: View {
    @Binding var emailSent: String
    @Binding var currpage: String
    @Binding var username: String
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Text("Please check your email")
                    .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    .padding().font(.largeTitle)
                Spacer()
            }
            
            Text("An email with a link to reset your password was sent to " + username + ".").padding()
                

            Spacer()
            //NavigationLink(destination: ContentView()) {
            
            Button {
                emailSent = "Done"
            } label: {
                //"Return to Login Screen"
                Text("Return to Start Page")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 320, height: 60).background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    .background(Color.gray)
                            .cornerRadius(15.0)
            }
            //}.navigationBarTitle("").navigationBarBackButtonHidden(true).navigationBarHidden(true)
            Spacer()
            
        }.padding()
    }
}

struct PassResetSent_Previews: PreviewProvider {
    static var previews: some View {
        PassResetSent(emailSent: .constant("Sent"), currpage: .constant("Forgot"), username: .constant("myemail@hotmail.com"))
    }
}
