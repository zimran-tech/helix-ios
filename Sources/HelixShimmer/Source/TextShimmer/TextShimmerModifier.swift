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
        isLoading: Bool
    ) -> some View {
        modifier(
            TextShimmerModifier(
                shimmerLength: length,
                isLoading: isLoading
            )
        )
    }
}

struct TextShimmerModifier: ViewModifier {
    public let shimmerLength: Int
    public let isLoading: Bool
    public func body(content: Content) -> some View {
        if isLoading {
            ShimmedTextView(
                isLoading: isLoading,
                shimmerLength: shimmerLength
            )
            
        } else {
            content
        }
    }
}


