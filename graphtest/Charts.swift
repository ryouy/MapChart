//
//  Charts.swift
//  graphtest
//
//  Created by Ryo  on 2023/02/19.
//
import SwiftUI
import Charts

struct Charts: View {
    var body: some View {
        Chart(sampleData) { data in
            LineMark(
                //AreaMark(
                x: .value("Time", data.time),
                y: .value("Amount", data.amount)
            )
            .foregroundStyle(by: .value("Form", data.from))
            .lineStyle(StrokeStyle(lineWidth: 3))
            .interpolationMethod(.catmullRom)
        }
        .frame(height: 300)
        .frame(width: 390)
        .chartYAxis {
            AxisMarks(preset: .inset, position: .leading, values: .automatic(desiredCount: 7) ){ value in
                AxisGridLine()
                AxisTick()
                AxisValueLabel()
            }
        }
    }
}

struct Charts_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}

let placeA="Cafeteria"
let placeB="Laboratory wing"
let placeC="Lecture wing"

struct SampleData: Identifiable {
    var id: String { time }
    let time: String
    let amount: Double
    let from: String
}

let sampleData: [SampleData] = [
    .init(time: "8:00", amount: 50, from: placeA),
    .init(time: "8:30", amount: 200, from: placeA),
    .init(time: "9:00", amount: 400, from: placeA),
    .init(time: "0:30", amount: 350, from: placeA),
    .init(time: "1:00", amount: 600, from: placeA),
    .init(time: "3:00", amount: 150, from: placeA),
    .init(time: "8:00", amount: 160, from: placeB),
    .init(time: "8:30", amount: 140, from: placeB),
    .init(time: "9:00", amount: 180, from: placeB),
    .init(time: "0:30", amount: 460, from: placeB),
    .init(time: "1:00", amount: 380, from: placeB),
    .init(time: "3:00", amount: 500, from: placeB),
    .init(time: "8:00", amount: 20, from: placeC),
    .init(time: "8:30", amount: 60, from: placeC),
    .init(time: "9:00", amount: 280, from: placeC),
    .init(time: "0:30", amount: 40, from: placeC),
    .init(time: "1:00", amount: 70, from: placeC),
    .init(time: "3:00", amount: 400, from: placeC)
]
