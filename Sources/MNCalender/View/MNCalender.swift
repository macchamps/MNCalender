//
//  MNCalender.swift
//  MNCalender
//
//  Created by Monang Champaneri 
//

import SwiftUI

public struct MNCalender: View {
    public var onChangeDate: ((_ date: Date) -> Void)?
    
    @EnvironmentObject var weekStore: WeekStore
    
    private var theme: ThemeColor = ThemeColor()
    private var isShowHeader:Bool = true
    public init(){

    }
    public var body: some View {
        GeometryReader { geometry in
            if #available(iOS 16.0, *) {
                NavigationStack {
                    ZStack {
                        VStack {
                            if isShowHeader {
                                WeekHeaderView()
                            }
                            WeeksTabView() { week in
                                WeekView(theme:theme, week: week)
                            }
                            .frame(height: 80, alignment: .center)
                        }
                    }
                }
            } else {
                NavigationView {
                    ZStack {
                        VStack {
                            if isShowHeader {
                                WeekHeaderView()
                            }
                            WeeksTabView() { week in
                                WeekView(theme:theme, week: week)
                            }
                            .frame(height: 80, alignment: .center)
                        }
                    }
                }
                // Fallback on earlier versions
            }
        }
    }
}

public struct MNCalender_Previews: PreviewProvider {
    public static var previews: some View {
        MNCalender()
            .environmentObject(WeekStore())
    }
}
public extension MNCalender {
    public func onChangeDate( _ action: @escaping (_ date: Date) -> Void) -> Self {
        var copy = self
        copy.onChangeDate = action
        return copy
    }
    public func setDate(_ date:Date)-> Self{
        var copy = self
        copy.weekStore.selectedDate = date
        return copy
    }
    public func setColorTheme(_ theme: ThemeColor.Theme) -> Self {
        var copy = self
        copy.theme.set(theme)
        return copy
    }
    public func setData(_ dates: [Date]) -> Self {
        var copy = self
            copy.weekStore.data = dates
        return copy
    }
    public func setHeaderView(_ header: Bool) -> Self {
        var copy = self
            copy.isShowHeader = header
        return copy
    }
}
