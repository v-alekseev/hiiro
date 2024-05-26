//
//  CalendarDayView.swift
//  Hiiro
//
//  Created by Vitaly on 25.05.2024.
//

import SwiftUI

struct CalendarDayView: View {
    var viewModel: any ActivityViewModelProtocol
    var day: DateComponent

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(self.day.isActiveDat ? .calendarDaySelected : .calendarDay)
                .frame(width: 44, height: 72)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(lineWidth: 2.0)
                        .frame(width: 52, height: 80)
                        .foregroundColor(day.isSelected ? .selectStroke : Color.clear)
                )
                .onTapGesture {
                    viewModel.selectDateComponent(day: day)
                }
            
            VStack {
                Text(day.activeDate.weekday)
                    .foregroundColor(.white)
                    .font(.footnote)
                    .padding(.top, 12)
                
                Text(day.activeDate.day)
                    .foregroundColor(.white)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }
            
        }   
    }
    
}

#Preview {
    CalendarDayView(viewModel: ActivityViewModel(), day: DateComponent(id: 0, activeDate: ActivityDate(Date()), isActiveDat: true, isSelected: true))
}
