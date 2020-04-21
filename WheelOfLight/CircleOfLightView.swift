//
//  ContentView.swift
//  WheelOfLight
//
//  Created by Ben Schultz on 10/14/19.
//  Copyright © 2019 com.concordbusinessservicesllc. All rights reserved.
//

import SwiftUI
import Foundation

struct CircleOfLightView: View {
    
    @EnvironmentObject var config: CircleConfiguration
    @State var rotate = true
    @State var showingConfiguration = false
    
    let gradient = Gradient(colors: [Color.red, .orange, .yellow, .green, .blue, .purple, .red])
    
    var duration: Double {
        (1.0 / config.speed) * 60.0
    }
    
    var configButton: some View {
        Button(action: {
            self.showingConfiguration.toggle()
        }) {
            Image(systemName: "gear")
                .imageScale(.medium)
                .accessibility(label: Text("Configure Circle"))
        }
        .sheet(isPresented: self.$showingConfiguration) {
            CircleControls().environmentObject(self.config)
        }
    }

    var body: some View {
        ZStack {
            
            VStack{
                Circle()
                    .stroke(AngularGradient(gradient: self.gradient,
                                            center: .center,
                                            startAngle: Angle(degrees: 0.0),
                                            endAngle: Angle(degrees: 360.0)
                        ),
                            lineWidth: config.circleWidth)
                    .scaleEffect(config.frameRatio)
                    .rotationEffect(.degrees(self.rotate ? 0.0 : 360.0), anchor: .center)
                    .animation(Animation.linear(duration: duration).repeatForever(autoreverses:false))
                    .background(config.bgColor)
                    .onAppear(){
                        self.rotate.toggle()
                    }
            }
            
            VStack {
                HStack {
                    Spacer()
                    configButton.frame(width:40, height: 40)
                }
                Spacer()
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct CircleOfLightView_Previews: PreviewProvider {
    static var previews: some View {
        CircleOfLightView().environmentObject(CircleConfiguration())    }
}
