//
//  StartPage.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 12/1/21.
//

import SwiftUI

struct StartPage: View {
    @State private var currpage = "Start"
    var body: some View {
        if currpage == "Start" {
            loginView(currpage: $currpage)
        } else if currpage == "Login" {
            UserLoginWrapper(currpage: $currpage)
        } else if currpage == "Forgot" {
            UserForgotWrapper(currpage: $currpage)
        }else {
            UserSignUp(currpage: $currpage)
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
