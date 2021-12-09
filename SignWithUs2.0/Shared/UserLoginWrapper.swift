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
    @State private var showConfirmedBooking = false
    var body: some View {
        //return Group {
            if showConfirmedBooking {
                ConfirmedBooking(showConfirmedBooking: $showConfirmedBooking)
                //
            } else if showingHome {
                ContentView($showConfirmedBooking)
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
