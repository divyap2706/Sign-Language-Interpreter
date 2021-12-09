//
//  InterpretersView.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/9/21.
//

import Foundation
import SwiftUI



struct InterpretersView: View {
    @Binding var booking: Booking
    @Binding var fromScheduleTab: Bool
    @Binding var showConfirmedBooking: Bool
    @State private var searchText = ""
    @State private var searchby = ""
    
    private func navBarTitle(fromScheduleTab:Bool) -> String {
        if fromScheduleTab == false {
            return "Interpreters"
            } else {
             return "Select an Interpreter"
            }
    }
    //@State var searchby = ""
    var body: some View {
        
        VStack(alignment: .leading){
            
            SearchBar(text: $searchText, searchby: $searchby)
                .multilineTextAlignment(.leading)
                .navigationBarTitle(self.navBarTitle(fromScheduleTab: fromScheduleTab)).padding(.bottom, 3.0)
            
            HStack{
                Spacer(minLength: 25)
                Text("Interpreter").underline().padding(.leading)
                Spacer(minLength: 45)
                Text("Location").underline().padding()
                Spacer()
                Text("Earliest Appointment").underline().padding(.trailing)
            }
            
            List (interpreters.filter({if (searchText.isEmpty){return true} else if (searchby == "Name"){return $0.name.contains(searchText)}
            else if (searchby == "Location"){return $0.location.contains(searchText)}
            else if (searchby == "Earliest Appointment"){return $0.earlDate.contains(searchText)}
            else{return true}
            })) { interpreter in
                NavigationLink(destination: InterpreterDetail(booking: $booking, fromScheduleTab: $fromScheduleTab, showConfirmedBooking: $showConfirmedBooking, interpreter: interpreter)) {
                InterpreterRow(interpreter: interpreter)
                }
            }
    }


    }

}


struct InterpretersView_Previews: PreviewProvider {
    @State static var previewBooking = interpTabBooking
    static var previews: some View {

        InterpretersView(booking: $previewBooking, fromScheduleTab: .constant(false), showConfirmedBooking: .constant(false))

    }

}


