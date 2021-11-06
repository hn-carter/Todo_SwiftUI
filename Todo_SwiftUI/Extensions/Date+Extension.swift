//
//  Date+Extension.swift
//  Todo_SwiftUI
//
//  Created by hn-carter on 2021/10/31.
//

import Foundation

extension Date {
    /**
     ユーザーが設定したタイムゾーンのグレゴリオ暦Calender
     */
    var calendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone.current
        calendar.locale   = Locale.current
        return calendar
    }

    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = Locale.current
        //dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    init(year: Int, month: Int = 1, day: Int = 1, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        let comp = DateComponents(calendar: Date().calendar, timeZone: TimeZone.current, year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        let date: Date = comp.date!
        self.init(timeInterval:0, since:date)
    }

    /**
     日付を文字列に変換
     */
    var dueDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.calendar = self.calendar
        return dateFormatter.string(from: self)
    }
}
