//
//  DateHelpers.swift
//  Task
//
//  Created by jdcorn on 11/14/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
