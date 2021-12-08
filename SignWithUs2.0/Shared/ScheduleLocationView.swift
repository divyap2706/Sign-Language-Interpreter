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
    @State private var eventType = "Select Event Type"
    @State private var additionalNotes = ""
    @State private var fromScheduleTab = true
    var body: some View {
        //ScrollView{
        VStack(alignment: .leading){
            
            //Text("Enter Event Details").font(.title).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).multilineTextAlignment(.leading).padding([.leading, .bottom])

        //}.padding()
            Form {
                Section(header: Text("Type")) {
         Picker(selection: $eventType, label: Text(eventType)) {
                Text("Select Event Type").tag("Select Event Type")
                Text("School Lecture/Presentation").tag("School Lecture/Presentation")
                Text("Corporate Meeting").tag("Corporate Meeting")
                Text("Small Buisness Meeting").tag("Small Buisness Meeting")
                Text("Political Rally/Event").tag("Political Rally/Event")
                Text("Personal/Family Event").tag("Personal/Family Event")
                Text("Other").tag("Other")
         }.pickerStyle(MenuPickerStyle()).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).padding(1.0)
                }.navigationBarTitle("Enter Event Details").padding(.bottom, 3.0)
                Section(header: Text("Address")) {
        TextField("Street Line 1", text: $street1).textContentType(.streetAddressLine1)
        TextField("Street Line 2", text: $street2).textContentType(.streetAddressLine2)
        TextField("City", text: $city).textContentType(.addressCity)
        TextField("State", text: $state).textContentType(.addressState)
        TextField("Zip", text: $zip).textContentType(.postalCode)
                }
        Section(header: Text("Additional Notes (for Interpreter)")) {
            TextEditor(text: $additionalNotes)
        }
                
                } // end of form
        //VStack(alignment: .leading){
            //Spacer()
            HStack {
                Spacer()
                NavigationLink(destination:  InterpretersView(fromScheduleTab: $fromScheduleTab)){        Text("Next")
                            .font(.headline)
                            .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding()
                            .frame(width: 320, height: 60)
                            .background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                            .cornerRadius(15.0)
                    }
                
                Spacer()
                }
        //}.padding() // end of vstack
            
        }.padding(.bottom)
    }
}

struct ScheduleLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleLocationView(street1: .constant(""), street2: .constant(""), city: .constant(""), state: .constant(""), zip: .constant(""))
    }
}
