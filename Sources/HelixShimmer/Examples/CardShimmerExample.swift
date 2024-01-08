//
//  CardShimmerExample.swift
//
//
//  Created by Arman Sarvardin on 05.01.2024.
//

import Foundation
import SwiftUI

struct CardShimmerExample: View {
    @State private var isLoading: Bool = true
    var body: some View {
        NavigationView {
            VStack(content: {
                List(0..<5) { _ in
                    CardView(isLoading: isLoading)
                }
            })
        }.task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isLoading = false
            }
        }
    }
    
    struct CardView: View {
        let isLoading: Bool
        var body: some View {
            VStack(content: {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .clipShape(.rect(cornerRadius: 8))
                    .shimmer(
                        isLoading: isLoading,
                        shape: .rect(cornerRadius: 8)
                    )
            })
            .animation(.default, value: isLoading)
        }
    }
}


struct CardShimmerExample_Preview: PreviewProvider {
    static var previews: some View {
        CardShimmerExample()
    }
}

