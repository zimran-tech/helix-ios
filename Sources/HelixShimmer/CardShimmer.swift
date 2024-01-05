//
//  File.swift
//
//
//  Created by Arman Sarvardin on 05.01.2024.
//

import Foundation
import SwiftUI
import UIKit

struct CardView: View {
    var body: some View {
        VStack(content: {
            Text("Hello")
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 100, height: 100)
                .overlay {
                    CardShimmer()
                        .clipShape(.rect(cornerRadius: 8))
                        .padding(-0.3)
                }
        })
    }
}


struct CardShimmer : View {
    @State private var show = false
    let center = UIScreen.main.bounds.width
    
    var body : some View {
        ZStack {
            Color.white
            Color.black.opacity(0.04)
            Color.white
                .mask(
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: .init(
                                    colors: [
                                        .clear,
                                        Color.white.opacity(0.6),
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

struct CardShimmer_Preview: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
