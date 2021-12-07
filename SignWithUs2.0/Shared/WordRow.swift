//
//  AppointmentRow.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/15/21.
//

import SwiftUI

struct WordRow: View {
    
    var word: Word
    
    var body: some View {
        HStack {

            Text(word.word_val)
            

        }
    }
}

struct WordRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {

            WordRow(word: words[0])

        }

        .previewLayout(.fixed(width: 300, height: 70))
    }
}
