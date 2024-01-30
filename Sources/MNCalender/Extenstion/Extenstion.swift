//
//  Extenstion.swift
//  MNCalender
//
//  Created by Monang Champaneri on 29/01/24.
//

import Foundation
import SwiftUI

extension Date {
    func string(_ format: String = kDateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        formatter.locale = Locale.autoupdatingCurrent
        formatter.timeZone = TimeZone.autoupdatingCurrent
        
        return formatter.string(from: self)
    }

}
let kDateFormat = "yyyyMMdd"

extension String {
    func date(_ format: String = kDateFormat) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        formatter.locale = Locale.autoupdatingCurrent
        formatter.timeZone = TimeZone.autoupdatingCurrent
        
        return formatter.date(from: self)
    }

}

extension View {
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
