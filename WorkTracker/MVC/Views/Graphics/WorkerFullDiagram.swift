//
//  WorkerFullDiagram.swift
//  WorkTracker
//
//  Created by Андрей Петров on 08.04.2024.
//

import Foundation

import Foundation
import SwiftUI
import SwiftUI

struct WorkerFullDiagram: View {
    var data = [30.0, 70.0]
    let colors: [Color] = [.red, .blue]

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
                        .scaleEffect(1.1)
                        .offset(x: 0, y: 0)
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

