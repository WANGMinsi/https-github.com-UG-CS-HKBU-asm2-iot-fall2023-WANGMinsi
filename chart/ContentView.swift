//
//  ContentView.swift
//  chart
//
//  Created by 汪敏思 on 5/11/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView {
            ChartView().tabItem {
                Image(systemName: "chart.xyaxis.line")
                Text("Chart")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
