//
//  planTabView.swift
//  Hiiro
//
//  Created by Vitaly on 26.05.2024.
//

import SwiftUI

struct PlanTabView<T>: View  where T: ActivityViewModelProtocol   {
    
    @ObservedObject private var viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                
                HStack() {
                    Text(viewModel.titleDate)
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                    
                    Spacer()
                    Image(.calendarIcon)
                }
                .padding(.top, 20)
                .padding(.leading, 24)
                .padding(.trailing, 20)
                
                CalendarView(dates: viewModel.dateComponents, viewModel: viewModel)
                    .padding(.top, 18)
                    .padding(.horizontal, 14)
                
                HStack {
                    Text("Activities")
                        .padding(.leading, 24)
                        .padding(.top, 36)
                    Spacer()
                }
                Spacer(minLength: 32)
                
                ActivityListView(activitis: viewModel.visibleActivitis)
                
                Spacer()
            }
            .navigationTitle("Training plan")
        }
    }
}


#Preview {
    PlanTabView(viewModel: ActivityViewModel(adp: ActivitiesDataProvider()))
}
