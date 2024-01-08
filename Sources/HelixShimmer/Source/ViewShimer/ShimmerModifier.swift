//
//  File.swift
//  
//
//  Created by Arman Sarvardin on 08.01.2024.
//

import Foundation
import SwiftUI


struct ShimmerModifier<S: Shape>: ViewModifier {
    let isLoading: Bool
    var shape: S

    init(isLoading: Bool, shape: S) {
        self.isLoading = isLoading
        self.shape = shape
    }

    func body(content: Content) -> some View {
        content
            .overlay {
                if isLoading {
                    ShimmerView()
                        .clipShape(shape)
                        .padding(-0.33)
                }
            }
    }
}

public extension View {
    func shimmer<S: Shape>(isLoading: Bool, shape: S) -> some View {
        modifier(ShimmerModifier(isLoading: isLoading, shape: shape))
    }
}
