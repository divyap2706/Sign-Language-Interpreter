//
//  InterpretersRow.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/9/21.
//

import Foundation
import SwiftUI


struct InterpreterRow: View {

    var interpreter: Interpreter


    var body: some View {

        HStack {

            interpreter.image

                .resizable()

                .frame(width: 50, height: 50)

            Text(interpreter.name)
            
            Spacer()
            
            Text(interpreter.location)

            Spacer()
            
            Text(interpreter.earlDate)

        }

    }

}


struct LandmarkRow_Previews: PreviewProvider {

    static var previews: some View {

        Group {

            InterpreterRow(interpreter: interpreters[0])

            InterpreterRow(interpreter: interpreters[1])

        }

        .previewLayout(.fixed(width: 300, height: 70))

    }

}
