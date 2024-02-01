//
//  WeekView.swift
//  MNCalender
//
//  Created by Monang Champaneri 
//

import SwiftUI

struct WeekView: View {
    public var onChangeDate: ((_ date: Date) -> Void)?
    @EnvironmentObject var weekStore: WeekStore
    public var theme = ThemeColor()
    var week: Week

    var body: some View {
        HStack {
            ForEach(0..<7) { i in
                VStack {
                    Spacer()
                        .frame(minHeight: 5)
                    Text(week.dates[i].toString(format: "EEE"))
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity)
                        .foregroundColor(week.dates[i] == week.referenceDate ? theme.selectedTextColor : theme.weekdayTextColor)
                    Spacer()
                        .frame(height: 10)
                    ZStack {
                        HStack{
                            Spacer()
                                .frame(width: 30)
                            Circle()
                                .frame(width: 5,height:5)
                                .foregroundColor(weekStore.data.contains(where: {$0.string("yyyyMMdd") == week.dates[i].string("yyyyMMdd")}) ? theme.dotColor : .clear)
                        }
                        Text(week.dates[i].toString(format: "d"))
                            .font(.system(size: 16))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(week.dates[i] == week.referenceDate ? theme.selectedTextColor : theme.weekdayTextColor)
                    }
                    Spacer()
                        .frame(minHeight: 5)

                }.background(week.dates[i] == week.referenceDate ? theme.selectedCircleColor : .clear)
                .frame(maxWidth: .infinity,maxHeight:.infinity)
                .cornerRadius(10, corners: [.bottomRight, .bottomLeft, .topLeft, .topRight])
                .onTapGesture {
                    withAnimation {
                        weekStore.selectedDate = week.dates[i]
                    }
                }
                .frame(maxWidth: .infinity)
                
            }
        }.background(Color.clear)
        .frame(maxHeight:.infinity)
        .padding(.init(top: 10, leading: 5, bottom: 10, trailing: 5))
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(week: .init(index: 1, dates:
                                [
                                    Date().yesterday.yesterday.yesterday,
                                    Date().yesterday.yesterday,
                                    Date().yesterday,
                                    Date(),
                                    Date().tomorrow,
                                    Date().tomorrow.tomorrow,
                                    Date().tomorrow.tomorrow.tomorrow
                                ],
                             referenceDate: Date()))
        .environmentObject(WeekStore())
    }
}
