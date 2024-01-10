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
    var primaryColor: Color?
    var secondaryColor: Color?

    init(
        isLoading: Bool,
        shape: S,
        primaryColor: Color? = nil,
        secondaryColor: Color? = nil
    ) {
        self.isLoading = isLoading
        self.shape = shape
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
    }
    
    func body(content: Content) -> some View {
        if isLoading {
            content
                .overlay {
                    ShimmerView(
                        primaryColor: primaryColor ?? Color.white,
                        secondaryColor: secondaryColor ?? Color.black.opacity(0.08)
                    )
                    .clipShape(shape)
                    .padding(-0.33)
                    
                }
        } else {
            content
        }
    }
}

public extension View {
    func shimmer<S: Shape>(
        isLoading: Bool,
        shape: S,
        primaryColor: Color? = nil,
        secondaryColor: Color? = nil
    ) -> some View {
        modifier(
            ShimmerModifier(
                isLoading: isLoading,
                shape: shape,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor
            )
        )
    }
}
