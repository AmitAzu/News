//
//  DateService.swift
//  News
//
//  Created by Amit on 14/03/2022.
//

import Foundation

class DateService: NSObject {
    
    static let shared = DateService()
    
    func getCurrentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}
