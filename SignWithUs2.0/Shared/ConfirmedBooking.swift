//
//  SwiftUIView.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 12/8/21.
//

import SwiftUI

struct ConfirmedBooking: View {
    @Binding var showConfirmedBooking: Bool
    var body: some View {
        VStack(alignment: .leading) {
        Spacer()
        Text("Your event has been booked!").font(.title).foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0)).padding(.bottom, 3.0)
        Spacer()
            
            
            HStack{
                Spacer()
            Button {
                showConfirmedBooking = false
            } label: {
                Text("Return to Home Screen").font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 320, height: 60)
                    .background(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
                    .cornerRadius(15.0)
            }
                Spacer()
            }
                
        }
        .padding()
            
        
    }
}

struct ConfirmedBooking_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmedBooking(showConfirmedBooking: .constant(false))
    }
}
