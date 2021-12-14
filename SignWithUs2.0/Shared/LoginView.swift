//
//  ContentView.swift
//  HCI Project
//
//  Created by Christina Ye on 11/5/21.
//  Modified by Shreyas on 12/08/21

import Foundation
import SwiftUI

struct loginView: View {
    @Binding var currpage: String
    @State private var someVar = false
    var body: some View {
        NavigationView {
        VStack(alignment: .leading) {
            //Spacer()
            HStack{
                Spacer()
                Image("home").resizable()
                    .padding(30)
                        //.frame(width: 400, height: 300)
                        .aspectRatio(contentMode: .fit)
                Spacer()
            }//.navigationBarTitle("Welcome").foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
            
            Spacer()
            HStack{
                Spacer()
                Text("SignWithUS").bold()
                    .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    .padding()
                    .frame(width: 300.0, height: 60.0).font(.largeTitle)
                Spacer()
            }
            Spacer()
            
            HStack{
                Spacer()
                Button {
                    currpage = "Login"
                } label: {
                Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 320, height: 60)
                            .background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    .cornerRadius(15.0)
                }
                Spacer()
            }
            
            HStack{
                Spacer()
                Button {
                    currpage = "SignUp"
                } label: {
                Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                            .padding()
                            .frame(width: 320, height: 60)
                            .cornerRadius(15.0).overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0), lineWidth: 2)
                            )
                }
                Spacer()
            }
            .padding(.bottom)
            Spacer()
            HStack{
                Spacer()
                Text("Or Sign In With")
                        .font(.headline)
                        .foregroundColor(.black)
                        //.padding()
                        .frame(width: 320, height:40)
                Spacer()
            }
            
            // Added third party sign in dummy options
            HStack{
                Spacer()
                Image("sign_in").resizable()
                                    
                                        //.frame(width: 400, height: 300)
                                        .aspectRatio(contentMode: .fit)
                Spacer()
            }
            Spacer()
        }
            
      }.navigationBarTitle("").navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
    
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView(currpage: .constant(""))
    }
}
