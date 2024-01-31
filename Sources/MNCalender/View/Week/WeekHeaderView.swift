//
//  WeekHeaderView.swift
//  MNCalender
//
//  Created by Monang Champaneri 
//

import SwiftUI

struct WeekHeaderView: View {
    public var theme = ThemeColor()
    @EnvironmentObject var weekStore: WeekStore
    @State var showDatePicker: Bool = false

    var body: some View {
        HStack {
         
            Button {
                withAnimation {
                    weekStore.nextPrevious()
                }
            } label: {
                Image(systemName: "chevron.left")
                    .renderingMode(.template)
                    .foregroundColor(theme.calenderIconText)
            }
            Text(weekStore.selectedDate.monthToString())
                .font(.system(size: 24))
                .fontWeight(.light)
                .foregroundColor(theme.calenderIconText)
            Button {
                withAnimation {
                    weekStore.nextMonth()
                }
            } label: {
                Image(systemName: "chevron.right")
                    .renderingMode(.template)
                    .foregroundColor(theme.calenderIconText)
            }
            Spacer()
            Button {
                showDatePicker = true
            } label: {
                Image(systemName:"calendar.badge.checkmark")
                    .renderingMode(.template)
                    .foregroundColor(theme.calenderIconText)
                Text("Calendar")
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .foregroundColor(theme.calenderIconText)
            }
            .padding(.init(top: 4, leading: 10, bottom: 4, trailing: 10))
            .background(theme.calenderBg)
            .cornerRadius(5, corners: .allCorners)
            .sheet(isPresented: $showDatePicker) {
                VStack {
                    DatePicker("Select a Date", selection: $weekStore.selectedDate, in: ...Date(), displayedComponents: [.date])
                          .datePickerStyle(GraphicalDatePickerStyle())
                          .padding()
                         .onChange(of: weekStore.selectedDate, perform: { _ in
                            showDatePicker = false
                         })
                }
            }
        }
        .background(Color.clear)
        .padding(.init(top: 5, leading: 10, bottom: -3, trailing: 8))
    }
}

struct WeekHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        WeekHeaderView()
            .environmentObject(WeekStore())
    }
}
