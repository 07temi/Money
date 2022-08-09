//
//  GroupsView.swift
//  Money
//
//  Created by Артем Черненко on 05.08.2022.
//

import SwiftUI

struct GroupsView: View {
    var body: some View {
        
        CircleShape()
            .fill()
            .aspectRatio(1.5, contentMode: .fit)
            .frame(width: 120, height: 120)
    }
}

struct CircleShape: Shape {
    func path(in rect: CGRect) -> Path {
        let r = rect.height / 2 * 1.5
        let center = CGPoint(x: rect.midX, y: rect.midY * 1.5)
        var path = Path()
        path.addArc(center: center, radius: r,
                        startAngle: Angle(degrees: 160), endAngle: Angle(degrees: 20), clockwise: false)
        path.closeSubpath()
        return path
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
