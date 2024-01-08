//
//  File.swift
//  
//
//  Created by Arman Sarvardin on 08.01.2024.
//

import Foundation
import SwiftUI

struct TextShimmerExample: View {
    @State private var isLoading: Bool = true
    var body: some View {
        NavigationView {
            VStack(content: {
                List(0..<5) { _ in
                    TextView(isLoading: true)
                }
            })
        }.task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isLoading = false
            }
        }
    }
    
    struct TextView: View {
        let isLoading: Bool
        var body: some View {
            Text("Sample")
                .shimmerText(
                    length: 10,
                    isLoading: isLoading,
                    primaryColor: Color.white
                )
        }
    }
}

struct TextShimmerViewExample_PreviewProvider: PreviewProvider {
    static var previews: some View {
        TextShimmerExample()
    }
}
