//
//  AppointmentDetailViewStatic.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/15/21.
//

import SwiftUI

struct AppointmentDetailViewStatic: View {
    
    var appointment: Appointment
    
    var body: some View {
        Text("Date").bold().font(.title2).padding(.leading).navigationBarTitle("Appointment")
        
        Text(appointment.date).padding([.leading, .bottom])
        
        Text("Location").bold().font(.title2).padding(.leading)
        
        Text(appointment.location).padding([.leading, .bottom])
        
        Text("Event Type").bold().font(.title2).padding(.leading)
        
        Text("My Event Type").padding([.leading, .bottom])
        
        Text("Interpreter").bold().font(.title2).padding(.leading)
        
        Text(appointment.interpreter).padding([.leading, .bottom])
    }
}

struct AppointmentDetailViewStatic_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentDetailViewStatic(appointment: appointments[0])
    }
}
