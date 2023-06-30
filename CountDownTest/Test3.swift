//
//  Test3.swift
//  CountDownTest
//
//  Created by Michael Jennings on 6/29/23.
//

import SwiftUI

struct Test3 : View {
    @State private var isLiked = false
    @State private var isSplashing = false
    
    var body: some View{
        ZStack{
            Rectangle().frame(width: 80,height: 80)
            
            Circle()
                .frame(width: 80,height: 80)
                .offset(x: 40)
            
            Circle()
                .frame(width: 80, height: 80)
                .offset(y:-40)
        }.rotationEffect(.degrees(-45))
            .foregroundColor(.red)
            .scaleEffect(2)
    }
}





struct Test3_Previews: PreviewProvider {
    static var previews: some View {
        Test3()
    }
}
