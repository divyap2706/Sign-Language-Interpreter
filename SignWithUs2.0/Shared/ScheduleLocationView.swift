//
//  ScheduleLocationView.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 12/6/21.
//

import SwiftUI

struct ScheduleLocationView: View {
    @Binding var street1: String
    @Binding var street2: String
    @Binding var city: String
    @Binding var state: String
    @Binding var zip: String
    var body: some View {
        ScrollView{
        VStack(alignment: .leading){
        Text("Enter Location of Event").font(.title).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).multilineTextAlignment(.leading).padding(.bottom, 1.0)
        TextField("Street Line 1", text: $street1).textContentType(.streetAddressLine1).padding()
            .cornerRadius(5.0)
            .padding(.bottom, 20)
        TextField("Street Line 2", text: $street2).textContentType(.streetAddressLine2).padding()
            .cornerRadius(5.0)
            .padding(.bottom, 20)
        TextField("City", text: $city).textContentType(.addressCity).padding()
            .cornerRadius(5.0)
            .padding(.bottom, 20)
        TextField("State", text: $state).textContentType(.addressState).padding()
            .cornerRadius(5.0)
            .padding(.bottom, 20)
        TextField("Zip", text: $zip).textContentType(.postalCode).padding()
            .cornerRadius(5.0)
            .padding(.bottom, 20)
        }.padding()
        }
    }
}

struct ScheduleLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleLocationView(street1: .constant(""), street2: .constant(""), city: .constant(""), state: .constant(""), zip: .constant(""))
    }
}
