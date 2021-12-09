//
//  ScheduleLocationView.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 12/6/21.
//

import SwiftUI

struct ScheduleLocationView: View {
    @Binding var booking: Booking
    @Binding var showConfirmedBooking: Bool
    @Binding var fromScheduleTab: Bool
    @State private var eventType = "Select Event Type"
    @State var tag: Int? = nil
    var body: some View {
        //ScrollView{
        VStack(alignment: .leading){
            
            //Text("Enter Event Details").font(.title).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).multilineTextAlignment(.leading).padding([.leading, .bottom])

        //}.padding()
            Form {
                Section(header: Text("Type")) {
         Picker(selection: $eventType, label: Text("Select Event Type")) {
                //Text("Select Event Type").tag("Select Event Type")
                Text("School Lecture/Presentation").tag("School Lecture/Presentation")
                Text("Corporate Meeting").tag("Corporate Meeting")
                Text("Small Buisness Meeting").tag("Small Buisness Meeting")
                Text("Political Rally/Event").tag("Political Rally/Event")
                Text("Personal/Family Event").tag("Personal/Family Event")
                Text("Other").tag("Other")
         }.foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).padding(1.0)
                }.navigationBarTitle("Enter Event Details").padding(.bottom, 3.0)
                Section(header: Text("Address")) {
                    TextField("Street Line 1", text: $booking.street1).textContentType(.streetAddressLine1)
                    TextField("Street Line 2", text: $booking.street2).textContentType(.streetAddressLine2)
                    TextField("City", text: $booking.city).textContentType(.addressCity)
                    TextField("State", text: $booking.state).textContentType(.addressState)
                    TextField("Zip", text: $booking.zip).textContentType(.postalCode)
                }
        Section(header: Text("Additional Notes (for Interpreter)")) {
            TextEditor(text: $booking.additionalNotes)
        }
                
                } // end of form
        //VStack(alignment: .leading){
            //Spacer()
            HStack {
                Spacer()
                
                if fromScheduleTab {
                NavigationLink(destination:  InterpretersView(booking: $booking, fromScheduleTab: $fromScheduleTab, showConfirmedBooking: $showConfirmedBooking),tag: 2, selection: $tag){ EmptyView()}
                Button(action: {
                    booking.eventType = eventType
                    self.tag = 2
                }, label: {
                    
                    Text("Next")
                                  .font(.headline)
                                  .foregroundColor(.white)
                          .multilineTextAlignment(.leading)
                          .padding()
                                  .frame(width: 320, height: 60)
                                  .background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                                  .cornerRadius(15.0)
                })
                    
                } else {
                    NavigationLink(destination:  BookingSummary(booking: $booking, showConfirmedBooking: $showConfirmedBooking),tag: 4, selection: $tag){ EmptyView()}
                    Button(action: {
                        booking.eventType = eventType
                        self.tag = 4
                    }, label: {
                        
                        Text("Next")
                                      .font(.headline)
                                      .foregroundColor(.white)
                              .multilineTextAlignment(.leading)
                              .padding()
                                      .frame(width: 320, height: 60)
                                      .background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                                      .cornerRadius(15.0)
                    })
                }
                
                
                Spacer()
                }
        //}.padding() // end of vstack
            
        }.padding(.bottom)
    }
}



struct ScheduleLocationView_Previews: PreviewProvider {
    @State static var previewBooking = schedTabBooking
    static var previews: some View {
        ScheduleLocationView(booking: $previewBooking,  showConfirmedBooking: .constant(false), fromScheduleTab: .constant(true))
    }
}
