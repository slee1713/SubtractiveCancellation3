//
//  SubtractiveCancellation3App.swift
//  Shared
//
//  Created by Spencer Lee on 2/26/21.
//

import SwiftUI

@main
struct SubtractiveCancellation3App: App {
    
    @StateObject var plotDataModel = PlotDataClass(fromLine: true)
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .environmentObject(plotDataModel)
                    .tabItem {
                        Text("Plot")
                    }
                TextView()
                    .environmentObject(plotDataModel)
                    .tabItem {
                        Text("Text")
                    }
                            
                            
            }
            
        }
    }
}
