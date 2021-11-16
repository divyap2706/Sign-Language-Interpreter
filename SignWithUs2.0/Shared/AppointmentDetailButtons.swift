//
//  AppointmentDetailButtons.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/15/21.
//

import SwiftUI

struct AppointmentDetailButtons: View {
    @State private var dummyVar = false
    var body: some View {
        HStack{
            Spacer()
            Button {
                dummyVar = true
            } label: {
                Text("Edit").bold().padding(.horizontal)
            }.foregroundColor(.blue)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 1)
            )
            
            Button {
                dummyVar = true
            } label: {
                Text("Cancel").bold().padding(.horizontal)
            }.foregroundColor(.red)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.red, lineWidth: 1)
            )
            Spacer()
        }
    }
}

struct AppointmentDetailButtons_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentDetailButtons()
    }
}
