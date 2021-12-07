//
//  AppointmentDetailViewStatic.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/15/21.
//

import SwiftUI

struct WordDetailViewStatic: View {
    
    var word: Word
    
    var body: some View {
        Text("Sign Language Vocabulary").bold()
            .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
            .padding().font(.largeTitle)
        Image(word.image_path).resizable()
            .padding(/*@START_MENU_TOKEN@*/.horizontal, 50.0/*@END_MENU_TOKEN@*/)
                .frame(width: 400.0, height: 300)
                .aspectRatio(contentMode: .fit)
        Text(word.word_val)
            .foregroundColor(Color(red: 112.0/256.0, green: 48.0/256.0, blue: 160.0/256.0, opacity: 1.0))
            .padding().font(.largeTitle)
        
    }
}

struct WordDetailViewStatic_Previews: PreviewProvider {
    static var previews: some View {
        WordDetailViewStatic(word: words[0])
    }
}
