//
//  DateExtension.swift
//  SkinCondition
//
//  Created by Daisoreanu, Laurentiu on 17.03.2023.
//

import Foundation

extension Date {
    func changeMinute(by minutes: Int) -> Date? {
        let result =  Calendar.current.date(byAdding: .minute, value: minutes, to: self)
        return result
    }
    
    func changeYear(by years: Int) -> Date? {
        let result =  Calendar.current.date(byAdding: .year, value: years, to: self)
        return result
    }
    
    func changeMonth(by month: Int) -> Date? {
        let result =  Calendar.current.date(byAdding: .month, value: month, to: self)
        return result
    }
    
    func toString(format: DateFormat) -> String {
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.stringFormat
        return dateFormatter.string(from: self)
    }
    
}

enum DateFormat {
    case dayMonthYear
    /// The ISO8601 formatted year "yyyy" i.e. 1997
    case isoYear
    /// The ISO8601 formatted year and month "yyyy-MM" i.e. 1997-07
    case isoYearMonth
    /// The ISO8601 formatted date "yyyy-MM-dd" i.e. 1997-07-16
    case isoDate
    /// The ISO8601 formatted date, time and sec "yyyy-MM-dd'T'HH:mm:ssZ" i.e. 1997-07-16T19:20:30+01:00
    case isoDateTime
    /// The ISO8601 formatted date, time and millisec "yyyy-MM-dd'T'HH:mm:ss.SSSZ" i.e. 1997-07-16T19:20:30.45+01:00
    case isoDateTimeFull
    /// The dotNet formatted date "/Date(%d%d)/" i.e. "/Date(1268123281843)/"
    case dotNet
    /// The RSS formatted date "EEE, d MMM yyyy HH:mm:ss ZZZ" i.e. "Fri, 09 Sep 2011 15:26:08 +0200"
    case rss
    /// The Alternative RSS formatted date "d MMM yyyy HH:mm:ss ZZZ" i.e. "09 Sep 2011 15:26:08 +0200"
    case altRSS
    /// The http header formatted date "EEE, dd MM yyyy HH:mm:ss ZZZ" i.e. "Tue, 15 Nov 1994 12:45:26 GMT"
    case httpHeader
    /// A generic standard format date i.e. "EEE MMM dd HH:mm:ss Z yyyy"
    case standard
    /// A custom date format string
    case custom(String)
    var stringFormat: String {
        switch self {
        case .dayMonthYear: return "EEE, dd MM yyyy"
        case .isoYear: return "yyyy"
        case .isoYearMonth: return "yyyy-MM"
        case .isoDate: return "yyyy-MM-dd"
        case .isoDateTime: return "yyyy-MM-dd'T'HH:mm:ssZ"
        case .isoDateTimeFull: return "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        case .dotNet: return "/Date(%d%f)/"
        case .rss: return "EEE, d MMM yyyy HH:mm:ss ZZZ"
        case .altRSS: return "d MMM yyyy HH:mm:ss ZZZ"
        case .httpHeader: return "EEE, dd MM yyyy HH:mm:ss ZZZ"
        case .standard: return "EEE MMM dd HH:mm:ss Z yyyy"
        case .custom(let customFormat): return customFormat
        }
    }
}
