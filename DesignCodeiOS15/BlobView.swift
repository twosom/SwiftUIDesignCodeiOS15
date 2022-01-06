//
//  BlobView.swift
//  DesignCodeiOS15
//
//  Created by Hope on 2022/01/07.
//

import SwiftUI

struct BlobView: View {

    @State(initialValue: false)
    private var isAppear: Bool

    var colors: [Color]

    var customAnimation: Animation = .linear(duration: 20).repeatForever().delay(1)


    var body: some View {
        TimelineView(.animation) { timeline in

            let now: TimeInterval = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 60)
            let x1: Double = cos(angle.radians)
            let angle2 = Angle.degrees(now.remainder(dividingBy: 6) * 10)
            let x2: Double = cos(angle2.radians)

            Canvas { (context: inout GraphicsContext, size: CGSize) in
                context.fill(
                        path(
                                in: CGRect(x: 0, y: 0, width: size.width, height: size.height),
                                x1: x1,
                                x2: x2
                        ),
                        with: .linearGradient(
                                Gradient(colors: colors),
                                startPoint: CGPoint(x: x1 * x1, y: x2),
                                endPoint: CGPoint(x: 400 * x2, y: 400 * x1 * 0.3)
                        )
                )
            }
                .frame(width: 400, height: 414)
                .rotationEffect(.degrees(isAppear ? 360 : 0))
        }
            .onAppear {
                withAnimation(customAnimation) {
                    self.isAppear = true
                }
            }


    }

    func path(in rect: CGRect, x1: Double, x2: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.9923 * width, y: 0.42593 * height))
        path.addCurve(
                to: CGPoint(x: 0.6355 * width * x2, y: height),
                control1: CGPoint(x: 0.92554 * width * x2, y: 0.77749 * height * x2),
                control2: CGPoint(x: 0.91864 * width * x2, y: height)
        )
        path.addCurve(
                to: CGPoint(x: 0.08995 * width, y: 0.60171 * height),
                control1: CGPoint(x: 0.35237 * width * x1, y: height),
                control2: CGPoint(x: 0.2695 * width, y: 0.77304 * height)
        )
        path.addCurve(
                to: CGPoint(x: 0.34086 * width, y: 0.06324 * height * x1),
                control1: CGPoint(x: -0.0896 * width, y: 0.43038 * height),
                control2: CGPoint(x: 0.00248 * width, y: 0.23012 * height * x1)
        )
        path.addCurve(
                to: CGPoint(x: 0.9923 * width, y: 0.42593 * height),
                control1: CGPoint(x: 0.67924 * width, y: -0.10364 * height * x1),
                control2: CGPoint(x: 1.05906 * width, y: 0.07436 * height * x2)
        )
        path.closeSubpath()
        return path
    }
}

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.9923 * width, y: 0.42593 * height))
        path.addCurve(to: CGPoint(x: 0.6355 * width, y: height), control1: CGPoint(x: 0.92554 * width, y: 0.77749 * height), control2: CGPoint(x: 0.91864 * width, y: height))
        path.addCurve(to: CGPoint(x: 0.08995 * width, y: 0.60171 * height), control1: CGPoint(x: 0.35237 * width, y: height), control2: CGPoint(x: 0.2695 * width, y: 0.77304 * height))
        path.addCurve(to: CGPoint(x: 0.34086 * width, y: 0.06324 * height), control1: CGPoint(x: -0.0896 * width, y: 0.43038 * height), control2: CGPoint(x: 0.00248 * width, y: 0.23012 * height))
        path.addCurve(to: CGPoint(x: 0.9923 * width, y: 0.42593 * height), control1: CGPoint(x: 0.67924 * width, y: -0.10364 * height), control2: CGPoint(x: 1.05906 * width, y: 0.07436 * height))
        path.closeSubpath()
        return path
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        BlobView(colors: [.pink, .blue])
    }
}
