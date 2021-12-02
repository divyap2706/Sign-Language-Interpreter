//
//  UserLoginWrapper.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 12/1/21.
//

import SwiftUI

struct UserLoginWrapper: View {
    @Binding var currpage: String
    @State private var showingHome = false
    var body: some View {
        //return Group {
            if showingHome {
                    ContentView()
            } else {
                UserLogin(showingHome: $showingHome, currpage: $currpage)
            }
        //}
    }
}

struct UserLoginWrapper_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginWrapper(currpage: .constant("Login"))
    }
}
