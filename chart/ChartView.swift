//
//  ChartView.swift
//  chart
//
//  Created by 汪敏思 on 5/11/2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    @State var readings = [Reading]()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Chart(readings) {
                LineMark(x: .value("Time", $0.time),
                         y: .value("Moisture", $0.moisture)
                )
            }.padding()
                .onAppear(perform: startLoad)
                .onReceive(timer) { input in
                    startLoad()
                }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct Reading: Identifiable {
    let time: Date
    let moisture: Int
    var id: String {time.description}
}

extension ChartView {
    func handleClientError(_: Error) {
        return
    }
    
    func handleServerError(_: URLResponse?) {
        return
    }
    
    func startLoad() {
        let url = URL(string: "http://localhost:7071/api/index")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                self.handleClientError(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                self.handleServerError(response)
                return
            }
            
            if let data = data {
                let reading = try
            }
        }
        task.resume()
    }
}
