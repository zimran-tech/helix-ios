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
    var primaryColor: Color = Color.white
    var secondaryColor: Color = Color.black
    
    public var body: some View {
        if isLoading {
            Text(getShimmerText())
                .foregroundStyle(.clear)
                .shimmer(
                    isLoading: isLoading,
                    shape: .capsule,
                    primaryColor: primaryColor,
                    secondaryColor: secondaryColor
                )
        }
    }
    
    func getShimmerText() -> String {
        return String(Array(repeating: "-", count: shimmerLength))
    }
}
