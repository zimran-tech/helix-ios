//
//  File.swift
//  
//
//  Created by Arman Sarvardin on 08.01.2024.
//

import Foundation
import SwiftUI

public struct ShimmedTextView: View {
    let isLoading: Bool
    let shimmerLength: Int
    
    public var body: some View {
        if isLoading {
            Text(getShimmerText())
                .shimmer(
                    isLoading: isLoading,
                    shape: .capsule
                )
        }
    }
    
    func getShimmerText() -> String {
        return String(Array(repeating: "-", count: shimmerLength))
    }
}
