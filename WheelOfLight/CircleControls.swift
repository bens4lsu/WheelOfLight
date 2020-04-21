//
//  CircleControls.swift
//  WheelOfLight
//
//  Created by Ben Schultz on 10/22/19.
//  Copyright © 2019 com.concordbusinessservicesllc. All rights reserved.
//

import SwiftUI

struct CircleControls: View {
    @EnvironmentObject private var config: CircleConfiguration
    @Environment(\.presentationMode) var presentationMode
    
    var ratioLabel: String {
        String(format: "Screen Ratio: %.2f", arguments: [config.frameRatio])
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("0").font(.caption)
                Slider(value: $config.speed, in: 0.2...150.0, step: 0.1)
                    .scaleEffect(x: 1, y: 0.5 , anchor: .top)
                Text("250").font(.caption)
            }
            Text("Speed: \(config.speed) RPM")
            
            Divider()
            
            HStack {
                Text("0").font(.caption)
                Slider(value: $config.frameRatio, in: 0.01...1.0, step: 0.1)
                    .scaleEffect(x: 1, y: 0.66 , anchor: .top)
                Text("1").font(.caption)
            }
            Text("Frame Ratio:  \(ratioLabel)")
            
            Divider()
            
            HStack {
                Text("1").font(.caption)
                Slider(value: $config.circleWidth, in: 1...300, step: 1)
                    .scaleEffect(x: 1, y: 0.66 , anchor: .top)
                Text("300").font(.caption)
            }
            Text("Circle Width:  \(config.circleWidth)")
            
            Divider()
            
            HStack {
                Button(action: {}){
                    Text("Dismiss")
                }
                Button(action: {}) {
                    Text("Cancel")
                }
            }
        }
    }
}


struct CircleControls_Previews: PreviewProvider {
    static var previews: some View {
        CircleControls().environmentObject(CircleConfiguration())
    }
}
