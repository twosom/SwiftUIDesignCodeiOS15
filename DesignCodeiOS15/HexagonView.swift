//
//  HexagonView.swift
//  DesignCodeiOS15
//
//  Created by Hope on 2022/01/04.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { (context: inout GraphicsContext, size: CGSize) in
            context.draw(Text("DesignCode").font(.largeTitle), at: .init(x: 50, y: 20))


            context.fill(Path(ellipseIn: CGRect(x: 20, y: 30, width: 100, height: 100)), with: .color(.pink))

            context.draw(Image("Blob 1"), in: CGRect(x: 0, y: 0, width: 200, height: 200))

            context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
            .frame(width: 200, height: 213)
            .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
