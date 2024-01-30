//
//  ThemeColor.swift
//  MNCalender
//
//  Created by Monang Champaneri on 29/01/24.
//

import Foundation
import SwiftUI
#if !os(macOS)
public struct ThemeColor {
    private var theme: Theme = .light
    
    public mutating func set(_ theme: Theme) {
        self.theme = theme
    }
    public var dotColor: Color {
        switch theme {
        case .light:
            return .black
        case .dark:
            return .white
        case .cyberpunk:
            return .green
        case .custom(bgColor: _,dotColor: let color, weekdayTextColor: _, weekendTextColor: _, todayTextColor: _, selectedTextColor: _, selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    public var bgColor: Color {
        switch theme {
        case .light:
            return Color(uiColor: .systemGroupedBackground)
        case .dark:
            return Color(uiColor: .darkGray)
        case .cyberpunk:
            return .black
        case .custom(bgColor: let color,dotColor: _, weekdayTextColor: _, weekendTextColor: _, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var weekdayTextColor: Color {
        switch theme {
        case .light:
            return .black
        case .dark:
            return .white
        case .cyberpunk:
            return .green
        case .custom(bgColor: _,dotColor: _, weekdayTextColor: let color, weekendTextColor: _, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var weekendTextColor: Color {
        switch theme {
        case .light:
            return Color(uiColor: .lightGray)
        case .dark:
            return Color(uiColor: .lightGray)
        case .cyberpunk:
            return .green.opacity(1.0)
        case .custom(bgColor: _,dotColor: _, weekdayTextColor: _, weekendTextColor: let color, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var todayTextColor: Color {
        switch theme {
        case .light:
            return .red
        case .dark:
            return .red
        case .cyberpunk:
            return .white
        case .custom(bgColor: _,dotColor: _, weekdayTextColor: _, weekendTextColor: _, todayTextColor: let color, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var selectedTextColor: Color {
        switch theme {
        case .light:
            return .white
        case .dark:
            return .black
        case .cyberpunk:
            return .green
        case .custom(bgColor: _,dotColor: _, weekdayTextColor: _, weekendTextColor: _, todayTextColor: _, selectedTextColor: let color, selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var selectedCircleColor: Color {
        switch theme {
        case .light:
            return .black
        case .dark:
            return .white
        case .cyberpunk:
            return .white
        case .custom(bgColor: _,dotColor: _, weekdayTextColor: _, weekendTextColor: _, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: let color, todaySelectedCircleColor: _, dateTextColor: _):
            return color
        }
    }
    
    public var todaySelectedCircleColor: Color {
        switch theme {
        case .light:
            return .red
        case .dark:
            return .red
        case .cyberpunk:
            return .white
        case .custom(bgColor: _,dotColor: _, weekdayTextColor: _, weekendTextColor: _, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: let color, dateTextColor: _):
            return color
        }
    }
    
    public var dateTextColor: Color {
        switch theme {
        case .light:
            return .black
        case .dark:
            return .white
        case .cyberpunk:
            return .green
        case .custom(bgColor: _,dotColor: _, weekdayTextColor: _, weekendTextColor: _, todayTextColor: _, selectedTextColor: _ , selectedCircleColor: _, todaySelectedCircleColor: _, dateTextColor: let color):
            return color
        }
    }
    
    public enum Theme {
        case light
        case dark
        case cyberpunk
        case custom(bgColor: Color = .white,
                    dotColor: Color = .black,
                    weekdayTextColor: Color = .white,
                    weekendTextColor: Color = .white,
                    todayTextColor: Color = .white,
                    selectedTextColor: Color = .white,
                    selectedCircleColor: Color = .white,
                    todaySelectedCircleColor: Color = .white,
                    dateTextColor: Color = .white
        )
    }
}
#endif
