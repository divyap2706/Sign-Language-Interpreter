//
//  InterpreterList.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/9/21.
//

import Foundation
import SwiftUI


struct InterpreterList: View {

    var body: some View {

        List (interpreters) { interpreter in

            InterpreterRow(interpreter: interpreter)

        }

    }

}


struct InterpreterList_Previews: PreviewProvider {

    static var previews: some View {

        InterpreterList()

    }

}
