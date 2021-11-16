//
//  File.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/15/21.
//
import Foundation
import SwiftUI


struct AppointmentsList: View {
    
    //var appointments: [Appointment]

    var body: some View {

        List (appointments) { appointment in

            AppointmentRow(appointment: appointment)

        }

    }

}


struct AppointmentsList_Previews: PreviewProvider {

    static var previews: some View {

        AppointmentsList()

    }

}
