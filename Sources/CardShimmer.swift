//
//  File.swift
//
//
//  Created by Arman Sarvardin on 05.01.2024.
//

import Foundation
import SwiftUI
import UIKit

@available(iOS 15.0, *)
@available(macOS 12.0, *)
struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
            Rectangle()
        }
        .frame(width: 300, height: 300)
        .overlay {
            CardShimmer()
        }
    }
}


struct CardShimmer : View {
    
    @State var show = false
    var center = UIScreen.main.bounds.width + 55
    
    var body : some View {
        ZStack{
            Color.white
            Color.black.opacity(0.09)
            Color.white
                .mask(
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: .init(colors: [.clear,Color.white.opacity(0.48),.clear]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .rotationEffect(.init(degrees: 70))
                        .offset(x: self.show ? center : -center)
                        .padding(-100)
                )
        }
        .onAppear {
            withAnimation(Animation.default.speed(0.2).delay(0).repeatForever(autoreverses: false)){
                self.show.toggle()
            }
        }
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
struct CardShimmer_Preview: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
