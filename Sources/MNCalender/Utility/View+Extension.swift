//
//  View+Extension.swift
//  MNCalender
//
//  Created by Monang Champaneri 
//

import Foundation

import SwiftUI

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
