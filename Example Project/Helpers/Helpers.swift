//
//  Helpers.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation
import ObjectMapper

struct V2PostMapping: MapContext {
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z"
        return formatter
    }
    
    static var dateShortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
}
