//
//  UserForgotWrapper.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 12/7/21.
//

import SwiftUI

struct UserForgotWrapper: View {
    @Binding var currpage: String
    @State private var emailSent: String = ""
    @State private var username: String = ""
    var body: some View {
        //return Group {
            if emailSent == "Done" {
                StartPage()
            } else if emailSent == "Sent" {
                PassResetSent(emailSent: $emailSent, currpage: $currpage, username: $username)
            } else {
                UserForgot(emailSent: $emailSent, currpage: $currpage, username: $username)
            }
        //}
    }
}

struct UserForgotWrapper_Previews: PreviewProvider {
    static var previews: some View {
        UserForgotWrapper(currpage: .constant("Forgot"))
    }
}

