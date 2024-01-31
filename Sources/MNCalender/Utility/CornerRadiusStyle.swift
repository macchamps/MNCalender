//
//  CornerRadiusStyle.swift
//  MNCalender
//
//  Created by Monang Champaneri 
//

import SwiftUI

@available(macOS 10.15, *)
struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
