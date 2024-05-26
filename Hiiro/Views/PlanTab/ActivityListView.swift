//
//  ScrollableListView.swift
//  Hiiro
//
//  Created by Vitaly on 26.05.2024.
//

import SwiftUI

struct ActivityListView: View {
    var activitis: [Activity]
    var body: some View {
        if activitis.count > 0 {
            List(activitis) {activity in
                ActivityRowView(activity: activity)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets.init(top: 0, leading: 20,bottom: 0, trailing: 20))
                    .frame(maxWidth: .infinity)
                    .listRowSeparator(.hidden)
            }
            .listRowSpacing(44)
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
        } else {
            VStack(alignment: .center) {
                Image(systemName: "gamecontroller")
                    .imageScale(.large)
                    .foregroundStyle(.gray)
                Text("There is no training today!")
                    .foregroundColor(.selectStroke)
                    .padding()
                
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 100)
        }
        
    }
}

#Preview {
    ActivityListView(activitis: ActivityViewModel(adp: ActivitiesDataProvider()).visibleActivitis)
}
