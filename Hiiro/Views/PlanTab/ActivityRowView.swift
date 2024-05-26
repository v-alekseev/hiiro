//
//  ActivityRowView.swift
//  Hiiro
//
//  Created by Vitaly on 25.05.2024.
//

import SwiftUI

struct ActivityRowView: View {
    private var activity: Activity
    var body: some View {
        HStack {
            activity.image
            ActivityRowText(activity: activity)
            Spacer()
            ActivityRowDate(activity: activity)
        }
    }
    init(activity: Activity) {
        self.activity = activity
    }
}

struct ActivityRowText: View {
    private var activity: Activity
    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.name)

            HStack(spacing: 13) {
                Text(activity.text1)
                Text(activity.text2)
                Spacer()
            }
            .foregroundColor(.selectStroke)
        }
    }
    init(activity: Activity) {
        self.activity = activity
    }
}

struct ActivityRowDate: View {
    private var activity: Activity
    var body: some View {
        VStack() {
            Text(activity.activeDate.day)
            Text(activity.activeDate.weekday)
                .foregroundColor(.selectStroke)
        }
    }
    init(activity: Activity) {
        self.activity = activity
    }
}

//#Preview("RowView") {
//    ActivityRowView()
//}
//
//#Preview("RowText") {
//    ActivityRowText()
//}

//#Preview("RowDate") {
//    ActivityRowDate()
//}
