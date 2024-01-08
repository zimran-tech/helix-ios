//
//  File.swift
//
//
//  Created by Arman Sarvardin on 05.01.2024.
//

import Foundation
import SwiftUI
import UIKit

struct ShimmerView : View {
    @State private var show = false
    let center = UIScreen.main.bounds.width
    var primaryColor: Color
    var secondaryColor: Color
    
    init(
        primaryColor: Color = Color.white,
        secondaryColor: Color = Color.black
    ) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
    }
    
    var body : some View {
        ZStack {
            primaryColor
            secondaryColor
            Color.white
                .mask(
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: .init(
                                    colors: [
                                        .clear,
                                        Color.white.opacity(0.75),
                                        .clear
                                    ]
                                ),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .rotationEffect(.init(degrees: 65))
                        .offset(x: self.show ? center : -center)
                        .padding(-100)
                )
        }
        .onAppear {
            withAnimation(
                Animation.easeInOut
                    .speed(0.15)
                    .delay(0)
                    .repeatForever(autoreverses: false)
            ) {
                self.show.toggle()
            }
        }
    }
}
