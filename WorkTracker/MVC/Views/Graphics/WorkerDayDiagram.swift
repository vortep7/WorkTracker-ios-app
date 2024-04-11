//
//  Diagram.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import Foundation
import SwiftUI

struct WorkerDayDiagram: View {
    var data: [Double]
    
    let colors: [Color] = [.diagramFirst, .diagramSecond]
    let lineWidth: CGFloat = 2.0
    let shadowRadius: CGFloat = 4.0

    var body: some View {
        GeometryReader { geometry in
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let radius = min(geometry.size.width, geometry.size.height) / 2 * 2.15

            ZStack {
                ForEach(0 ..< self.data.count) { i in
                    let startAngle = self.angle(for: i)
                    let endAngle = self.angle(for: i + 1)
                    PieSlice(startAngle: startAngle, endAngle: endAngle)
                        .fill(self.colors[i % self.colors.count])
                        .overlay(
                            PieSlice(startAngle: startAngle, endAngle: endAngle)
                                .stroke(Color.white, lineWidth: self.lineWidth)
                                .shadow(color: Color.black.opacity(0.3), radius: self.shadowRadius, x: 0, y: 0)
                        )
                        .scaleEffect(1.1)
                }
            }
            .rotationEffect(.degrees(-90))
            .frame(width: radius * 2, height: radius * 2)
            .position(center)
        }
    }

    private func angle(for index: Int) -> Angle {
        let total = data.reduce(0, +)
        let start = data.prefix(index).reduce(0, +)
        return Angle(degrees: 360 * start / total)
    }
}

struct PieSlice: Shape {
    var startAngle: Angle
    var endAngle: Angle

    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.move(to: CGPoint(x: rect.midX, y: rect.midY))
        p.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        return p
    }
}
