//
//  Date+Extension.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import Foundation

extension Date {
    func timeAgo() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        var timeAgo = formatter.localizedString(for: self, relativeTo: Date())
        if timeAgo.contains("0 sec") {
            timeAgo = "Now"
        }else if timeAgo.contains("1 day") {
            timeAgo = "Yesterday"
        }
        return timeAgo
    }
}
