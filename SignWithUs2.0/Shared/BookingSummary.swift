//
//  BookingSummary.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 12/7/21.
//

import SwiftUI

struct BookingSummary: View {
    @Binding var booking: Booking
    @Binding var showConfirmedBooking: Bool
    var body: some View {
        ScrollView{
        VStack(alignment: .leading) {
                    
                VStack(alignment: .leading) {
                //Text("Date and Time").font(.title).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                
                    Text("Date").bold().padding([.bottom], 1.0).navigationBarTitle("Booking Summary").padding(.bottom, 3.0)
                    Text(booking.date ?? Date(), style: .date).padding([.bottom])
                    Text("Start Time").bold().padding([.bottom], 1.0)
                    Text(booking.startTime).padding([.bottom])
                    Text("End Time").bold().padding([.bottom], 1.0)
                    Text(booking.endTime).padding([.bottom])
                
                
            }
            VStack(alignment: .leading) {
                //Text("Event Details").font(.title).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).padding(.bottom, 3.0)
                
                Text("Event Type").bold().padding([.bottom], 1.0)
                Text(booking.eventType).padding([.bottom])
                Text("Address").bold().padding([.bottom], 1.0)
                Text(booking.address()).padding([.bottom])
                Text("Additional Notes").bold().padding([.bottom], 1.0)
                    Text(booking.additionalNotes).padding([.bottom])
                Text("Interpreter").bold().padding([.bottom], 1.0)
                
                Text(booking.interpreter).padding([.bottom], 30.0)

            }
            
            
            HStack{
            Button {
                showConfirmedBooking = true
            } label: {
                Text("Confirm Booking").font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 320, height: 60)
                    .background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    .cornerRadius(15.0)
            }
            }
                
        }
        .padding()
            
        }
    }
}

struct BookingSummary_Previews: PreviewProvider {
    @State static var previewBooking = interpTabBooking
    static var previews: some View {
        BookingSummary(booking: $previewBooking, showConfirmedBooking: .constant(false))
    }
}
