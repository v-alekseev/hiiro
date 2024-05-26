//
//  ContentView.swift
//  Hiiro
//
//  Created by Vitaly on 23.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab){
            Text("PAGE ONE")
                .tabItem({
                    Image(systemName: "house")
                    Text("Home")
                        .font(.system(size: 10))
                })
                .tag(0)

            PlanTabView(viewModel: ActivityViewModel(adp: ActivitiesDataProvider()))
                  .tabItem({
                      Image(systemName: "calendar")
                      Text("Plan")
                          .font(.system(size: 10))
                  })
                  .tag(1)
              
            Text("PAGE THREE")
                  .tabItem({
                      Image(systemName: "figure.run.square.stack")
                      Text("Coach")
                          .font(.system(size: 10))
                  })
                  .tag(2)
              
            Text("PAGE FOUR")
                  .tabItem({
                      Image(systemName: "person")
                      Text("Profile")
                          .font(.system(size: 10))
                  })
                  .tag(3)
          }
       
        
        
    }
}

#Preview {
    ContentView()
}
