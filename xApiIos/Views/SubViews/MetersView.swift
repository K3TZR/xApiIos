//
//  MetersView.swift
//  xApiMac
//
//  Created by Douglas Adams on 3/29/21.
//

import SwiftUI
import xClient

struct MetersView: View {
    @EnvironmentObject var meterManager: MeterManager

    var body: some View {
        VStack(alignment: .leading) {
            MetersHeaderView()
                .environmentObject(meterManager)
            MetersListHeadingView()
            MetersListView()
                .environmentObject(meterManager)
        }
        .padding()
    }
}

struct MetersHeaderView: View {
    @EnvironmentObject var meterManager: MeterManager

    var body: some View {
        VStack(spacing: 20) {
            Text("NOTE: Meter display is being refreshed once a second, actual data rate may be faster or slower").foregroundColor(.red)
            HStack {
                Text("Value < Low")
                Text("YELLOW").foregroundColor(.yellow).padding(.trailing, 20)
                Text("Value within limits")
                Text("GREEN").foregroundColor(.green).padding(.trailing, 20)
                Text("Value > High")
                Text("RED").foregroundColor(.red).padding(.trailing, 20)
            }
            FilterView(selection: $meterManager.filterSelection,
                       text: $meterManager.filterText,
                       choices: MeterManager.MeterFilter.allCases.map {$0.rawValue},
                       message: "Filter Meters by")
        }
    }
}

struct MetersListHeadingView: View {
    var body: some View {

        let width: CGFloat = 60

        VStack(alignment: .leading) {
            Divider()
            HStack(spacing: 10) {
                Text("Id").frame(width: 30)
                Text("Source").frame(width: width)
                Text("Group").frame(width: width)
                Text("Name").frame(width: 110, alignment: .leading)
                Text("Value").frame(width: 80, alignment: .trailing)
                Text("Units").frame(width: 50, alignment: .leading)
                Text("Low").frame(width: width, alignment: .trailing)
                Text("High").frame(width: width, alignment: .trailing)
                Text("FPS").frame(width: 40, alignment: .trailing)
                Text("Description").frame(alignment: .leading)
            }.padding(.horizontal, 15)
            Divider()
        }
    }
}

struct MetersListView: View {
    @EnvironmentObject var meterManager: MeterManager
    @State var meterSelection: UInt16?

    func valueColor(_ value: Float, _ low: Float, _ high: Float) -> Color {
        if value > high { return .red }
        if value < low { return .yellow }
        return .green
    }

    var body: some View {

        let width: CGFloat = 60

        VStack(alignment: .leading) {
            List(meterManager.filteredMeters, id: \.id, selection: $meterSelection) { meter in
                HStack(spacing: 10) {
                    Text(String(meter.id)).frame(width: 30)
                    Text(meter.source).frame(width: width)
                    Text(meter.group).frame(width: width)
                    Text(meter.name).frame(width: 110, alignment: .leading)
                    Text( String(format: "%3.2f", meter.value) )
                        .foregroundColor(valueColor(meter.value, meter.low, meter.high))
                        .frame(width: 80, alignment: .trailing)
                    Text(meter.units).frame(width: 50, alignment: .leading)
                    Text(String(meter.low)).frame(width: width, alignment: .trailing)
                    Text(String(meter.high)).frame(width: width, alignment: .trailing)
                    Text(String(meter.fps)).frame(width: 40, alignment: .trailing)
                    Text(meter.desc).frame(alignment: .leading)
                }
            }
        }
    }
}

struct MetersView_Previews: PreviewProvider {
    static var previews: some View {
        MetersView()
            .environmentObject(MeterManager())
            .previewDevice("iPad (8th generation)")
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
