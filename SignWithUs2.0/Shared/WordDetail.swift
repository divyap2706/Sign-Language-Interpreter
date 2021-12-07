//
//  AppointmentDetail.swift
//  SignWithUs2.0
//
//  Created by Maximilian Christ on 11/15/21.
//

import SwiftUI

struct WordDetail: View {
    
    var word: Word
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
//            HStack{
//                Spacer()
//            }

            WordDetailViewStatic(word: word)
            
            Spacer()
            
        }.navigationBarTitle("Account", displayMode: .inline)
    }
}

struct WordDetail_Previews: PreviewProvider {
    static var previews: some View {
        WordDetail(word: words[0])
    }
}
