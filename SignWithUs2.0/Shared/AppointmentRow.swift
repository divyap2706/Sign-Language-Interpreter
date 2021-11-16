//
//  AppointmentRow.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/15/21.
//

import SwiftUI

struct AppointmentRow: View {
    
    var appointment: Appointment
    
    var body: some View {
        HStack {

            Text(appointment.date)
            
            Spacer(minLength: 10)
            
            Text(appointment.location)

            Spacer(minLength: 10)
            
            Text(appointment.interpreter)

        }
    }
}

struct AppointmentRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {

            AppointmentRow(appointment: appointments[0])

            AppointmentRow(appointment: appointments[1])

        }

        .previewLayout(.fixed(width: 300, height: 70))
    }
}
