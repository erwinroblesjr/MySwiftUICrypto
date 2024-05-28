//
//  CircleButtonAnimationView.swift
//  MySwiftUICrypto
//
//  Created by Erwin Robles on 5/27/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1 : 0.0)
            .opacity(animate ? 0 : 1)
            .animation((animate ? .easeOut(duration: 1) : .none), value: animate)
    }
}

#Preview {
//    CircleButtonAnimationView(animate: false)
    CircleButtonAnimationView(animate: .constant(false))
}

