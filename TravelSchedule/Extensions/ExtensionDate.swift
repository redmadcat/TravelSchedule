//
//  ExtensionDate.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 13.01.2026.
//

import Foundation

extension Date {
    func allDates(till endDate: Date) -> [Date] {
        var date = self
        var array: [Date] = []
        while date <= endDate {
            array.append(date)
            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        }
        return array
    }
}

//if let date = Calendar.current.date(byAdding: .day, value: 20, to: Date()) {
//    print(Date().allDates(till: date))
//}
