//
//  ContentView.swift
//  TwitterLikeAnimation
//
//  Created by Amos Gyamfi on 13.2.2021.
//

import SwiftUI

struct Test4: View {
    
    // Animations: Scale, color change and inner stroke (stroke border)
    @State private var circleSize = 0.0
    @State private var circleInnerBorder = 35
    @State private var circleHue = 200
    
    // Scaling Spring Animation
    @State private var heart = Image(systemName: "heart")
    
    // Scale and opacity animations
    @State private var splash = 0.0
    @State private var splashTransparency = 1.0
    
    @State private var scaleHeart = 0.0
    
    // Increase number
    @State private var liked: Int = 239
    
    @State private var iconColor = Color(.white)
    
    var body: some View {
       
        ZStack {
            HStack {
                    ZStack {
                        Image(systemName: "heart")
                            .font(.system(size: 60))
                        
                        Circle()
                            .strokeBorder(lineWidth:  CGFloat(circleInnerBorder))
                            .animation(Animation.easeInOut(duration: 0.5).delay(0.1),value: liked)
                            .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(.systemPink))
                            .hueRotation(Angle(degrees: Double(circleHue)))
                            .scaleEffect(CGFloat(circleSize))
                            .animation(Animation.easeInOut(duration: 0.5),value: liked)
                        
                        Image("splash")
                            .opacity(Double(splashTransparency))
                            .animation(Animation.easeInOut(duration: 0.5).delay(0.25),value: liked)
                            .scaleEffect(CGFloat(splash))
                            .animation(Animation.easeInOut(duration: 0.5),value: liked)
                        
                        // Rotated splash
                        Image("splash")
                            .rotationEffect(.degrees(90))
                            .opacity(Double(splashTransparency))
                            .animation(Animation.easeInOut(duration: 0.5).delay(0.2),value: liked)
                            .scaleEffect(CGFloat(splash))
                            .animation(Animation.easeOut(duration: 0.5),value: liked)
                    }
                    
                    Text("\(liked)")
            }
            
            // Filled heart icon
            HStack {
                heart
                    .font(.system(size: 64))
                    .scaleEffect(CGFloat(scaleHeart))
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(0.25),value: liked)
                
                Text("\(liked)")
            }
        } // All views
        .foregroundColor(iconColor)
        .onTapGesture {
            if(liked % 2 == 0){
                heart = Image(systemName: "heart.fill")
                scaleHeart = 1
                liked += 1 // Increase the number of likes by 1
                iconColor = Color(.systemPink)
                circleSize = 1.3
                circleInnerBorder = 0
                circleHue = 300
                splash = 1.5
                splashTransparency = 0.0
            }else
            {
                heart = Image(systemName: "heart")
                scaleHeart = 0.0
                liked += 1 // Increase the number of likes by 1
                iconColor = Color(.white)
                circleSize = 0.0
                circleInnerBorder = 35
                circleHue = 200
                splash = 0.0
                splashTransparency = 1.1
            }
            

        }
    }
}

struct Test4_Previews: PreviewProvider {
    static var previews: some View {
        Test4()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
