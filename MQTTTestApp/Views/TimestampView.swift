//
//  TimestampView.swift
//  MQTTTestApp
//
//  Created by Kenneth Rosener on 1/29/23.
//

import SwiftUI

struct TimestampView: View {
    @StateObject var timestampViewModel : TimestampViewModel
    
    var body: some View {
        VStack {
            Button("Connect") {
                timestampViewModel.connect()
            }
            Button("Subscribe") {
                timestampViewModel.subscribe()
            }
            Button("Send") {
                timestampViewModel.sendTimestamp()
            }.padding()
            Text("Current Timestamp: \n \(timestampViewModel.stamp)")
        }
    }
}

struct TimestampView_Previews: PreviewProvider {
    static var previews: some View {
        TimestampView(timestampViewModel: TimestampViewModel())
    }
}
