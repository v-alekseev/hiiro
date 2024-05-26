//
//  ScrollableHStackView.swift
//  Hiiro
//
//  Created by Vitaly on 26.05.2024.
//

import SwiftUI

struct CalendarView: View {
    var dates: [DateComponent]
    var viewModel: any ActivityViewModelProtocol
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView (.horizontal) {
                HStack(spacing: 8) {
                    // Добавьте ваши элементы сюда
                    ForEach(dates) { date in
                        CalendarDayView(viewModel: viewModel, day: date)
                            .id(date.id)
                    }
                    
                }
                .padding(.all, 5)
            }
            .defaultScrollAnchor(.center)
        }
    }

}

#Preview {
    CalendarView(dates: ActivityViewModel().dateComponents, viewModel: ActivityViewModel())
}
