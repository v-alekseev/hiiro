//
//  ContentView.swift
//  Hiiro
//
//  Created by Vitaly on 23.05.2024.
//

import SwiftUI

//struct ContentView<T>: View  where T: ActivityViewModelProtocol {
struct ContentView: View {
    
  
    //@ObservedObject private var viewModel: T
    @State private var selectedTab = 1
    
   
//    init(viewModel: T) {
//        self.viewModel = viewModel
//    }
    
    var body: some View {
        TabView(selection: $selectedTab){
            Text("PAGE ONE")
                .tabItem({
                    Image(systemName: "house")
                    Text("Home")
                        .font(.system(size: 10))
                })
                .tag(0)

            PlanTabView(viewModel: ActivityViewModel())
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



//
//struct ContentView<T>: View  where T: ActivityViewModelProtocol {
//    
//    @ObservedObject private var viewModel: T
//   
//    init(viewModel: T) {
//        self.viewModel = viewModel
//    }
//    
//    var body: some View {
//
//            VStack(alignment: .leading, spacing: 0) {
//                
//                Text("Training plan")
//                    .font(.title)
//                    .padding(.top, 32)
//                    .padding(.leading, 24)
//                
//                HStack() {
//                    Text(viewModel.titleDate)
//                        .font(Font.custom("Sharp Grotesk PE Trial Medium", size: 16))
//                        .fontWeight(.regular)
//                    
//                    Spacer()
//                    Image(.calendarIcon)
//                }
//                .padding(.top, 40)
//                .padding(.leading, 24)
//                .padding(.trailing, 20)
//                
//                CalendarView(dates: viewModel.dateComponents, viewModel: viewModel)
//                    .padding(.top, 18)
//                    .padding(.horizontal, 14)
//                
//                HStack {
//                    Text("Activities")
//                        .padding(.leading, 24)
//                        .padding(.top, 36)
//                    Spacer()
//                }
//                
//                
//                ActivityListView(activitis: viewModel.visibleActivitis)
//                
//                Spacer()
//
//        }
//        
//        
//        
//    }
//}
