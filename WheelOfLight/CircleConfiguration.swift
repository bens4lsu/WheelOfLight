//
//  CircleSettings.swift
//  WheelOfLight
//
//  Created by Ben Schultz on 10/22/19.
//  Copyright © 2019 com.concordbusinessservicesllc. All rights reserved.
//

import Combine
import SwiftUI

final class CircleConfiguration: ObservableObject {
    @Published var speed = 33.33
    @Published var frameRatio: CGFloat = 0.7
    @Published var bgColor: Color = .black
    @Published var circleWidth: CGFloat = 270
    @Published var configButtonInCenter = true
}

