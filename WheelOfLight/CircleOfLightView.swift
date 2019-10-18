//
//  ContentView.swift
//  WheelOfLight
//
//  Created by Ben Schultz on 10/14/19.
//  Copyright © 2019 com.concordbusinessservicesllc. All rights reserved.
//

import SwiftUI

struct CircleOfLightView: View {
    let frameRatio: CGFloat = 0.7
    let gradient = Gradient(colors: [Color.red, .orange, .yellow, .green, .blue, .purple, .red])
    let circleWidth: CGFloat = 270.0
    let speed: Double = 12  //0 to 50
    //let bgColor: Color.black
    
    @State var rotate = false;
        
    var body: some View {
        Circle()
            .stroke(AngularGradient(gradient: self.gradient,
                                    center: .center,
                                    startAngle: Angle(degrees: 0.0),
                                    endAngle: Angle(degrees: 360.0)
                ),
                    lineWidth: self.circleWidth)
            .scaleEffect(self.frameRatio)
            .rotationEffect(.degrees(self.rotate ? 0 : -1440), anchor: .center)
            .animation(Animation.linear(duration: 100.0 / speed).repeatForever(autoreverses:false))
            .onAppear(){
                self.rotate.toggle()
            }
        .background(Color.black)
    }
}



struct CircleOfLightView_Previews: PreviewProvider {
    static var previews: some View {
        CircleOfLightView()
    }
}
