//
//  TextShimmerModifier.swift
//
//
//  Created by Arman Sarvardin on 08.01.2024.
//

import Foundation
import SwiftUI


public extension View {
    func shimmerText(
        length: Int,
        isLoading: Bool,
        primaryColor: Color? = nil,
        secondaryColor: Color? = nil
    ) -> some View {
        modifier(
            TextShimmerModifier(
                shimmerLength: length,
                isLoading: isLoading,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor
            )
        )
    }
}

struct TextShimmerModifier: ViewModifier {
    public let shimmerLength: Int
    public let isLoading: Bool
    public var primaryColor: Color?
    public var secondaryColor: Color?
    public func body(content: Content) -> some View {
        if isLoading {
            ShimmedTextView(
                isLoading: isLoading,
                shimmerLength: shimmerLength,
                primaryColor: primaryColor ?? Color.white,
                secondaryColor: secondaryColor ?? Color.black.opacity(0.08)
            )
            
        } else {
            content
        }
    }
}


