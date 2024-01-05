//
//  CardShimmerExample.swift
//
//
//  Created by Arman Sarvardin on 05.01.2024.
//

import Foundation
import SwiftUI

struct CardShimmerExample: View {
    var body: some View {
        NavigationView {
            VStack(content: {
                List(0..<5) { _ in
                    CardView()
                }
            })
        }
    }
}

struct CardShimmerExample_Preview: PreviewProvider {
    static var previews: some View {
        CardShimmerExample()
    }
}
