//
//  BookingSummary.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 12/7/21.
//

import SwiftUI

struct BookingSummary: View {
    @State private var dummyVar = false
    var body: some View {
        ScrollView{
        VStack(alignment: .leading) {
                    
                VStack(alignment: .leading) {
                Text("Date and Time").bold().font(.title2).navigationBarTitle("Booking Summary").padding(.bottom, 3.0)
                
                Text("Date").padding([.bottom])
                Text("Start Time").padding([.bottom])
                Text("End Time").padding([.bottom])
                
                
            }
            VStack(alignment: .leading) {
                Text("Event Details").bold().font(.title2).padding(.bottom, 3.0)
                
                Text("Event Type").padding([.bottom])
                
                Text("Address").padding([.bottom])
                
                Text("Additional Notes").padding([.bottom])
                
                Text("Interpreter").bold().font(.title2).padding(.bottom, 3.0)
                
                Text("Interpreter").padding([.bottom])

            }
            
            HStack{
            Button {
                dummyVar = true
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
    static var previews: some View {
        BookingSummary()
    }
}
