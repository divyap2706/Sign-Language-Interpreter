//
//  AppointmentDetail.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/15/21.
//

import SwiftUI

struct AppointmentDetail: View {
    
    var appointment: Appointment
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack{
                Spacer()
            }

            AppointmentDetailViewStatic(appointment: appointment)
            
            AppointmentDetailButtons()
            
            Spacer()
            
        }
    }
}

struct AppointmentDetail_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentDetail(appointment: appointments[0])
    }
}
