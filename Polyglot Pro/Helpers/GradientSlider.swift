//
//  GradientSlider.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-18.
//

import SwiftUI

struct GradientSlider: View {
    @Binding var value: Double
    var range: ClosedRange<Double>
    var step: Double

    var body: some View {
        GeometryReader { geometry in
            let sliderWidth = geometry.size.width

            ZStack(alignment: .leading) {
                LinearGradient(colors: [.blue, .purple, .purple], startPoint: .leading, endPoint: .trailing)
                    .frame(height: 4)
                    .cornerRadius(2)
                    .padding(.leading, 12)
                    .padding(.trailing, -12)

                Circle()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                    .offset(x: CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) * (sliderWidth - 24))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                let location = gesture.location.x
                                let newValue = Double(location / (sliderWidth - 24)) * (range.upperBound - range.lowerBound) + range.lowerBound
                                value = min(max(range.lowerBound, round(newValue / step) * step), range.upperBound)
                            }
                    )
            }
            .padding(.horizontal, 12)
        }
        .frame(height: 44)
    }
}
