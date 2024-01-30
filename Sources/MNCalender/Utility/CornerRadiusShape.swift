//
//  CornerRadiusShape.swift
//  InfiniteWeekView
//
//  Created by Monang Champaneri 
//

import SwiftUI

@available(macOS 10.15, *)
struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

