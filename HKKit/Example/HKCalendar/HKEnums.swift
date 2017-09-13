//
//  HKEnums.swift
//  HKKit
//
//  Created by Hardik Shah on 13/09/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import Foundation
import AFDateHelper
import HKKit

public enum ENUM_WEEKDAY: String,ViewPager {
    case ALL = "All Day"
    case Sunday = "Sunday"
    case Monday = "Monday"
    case Tuesday = "Tuesday"
    case Wednesday = "Wednesday"
    case Thursday = "Thursday"
    case Friday = "Friday"
    case Saturday = "Saturday"
    
    
    public var mainValue:Int{
        
        switch self {
        case .Sunday:
            return 0
            
        case .Monday:
            return 1
        case .Tuesday:
            return 2
        case .Wednesday:
            return 3
        case .Thursday:
            return 4
        case .Friday:
            return 5
        case .Saturday:
            return 6
            
            
        default:
            return -1
        }
        
    }
    
    public static func getWeek(fromInt:Int)->ENUM_WEEKDAY {
        
        return self.days.filter({$0.mainValue == fromInt}).first ?? ENUM_WEEKDAY.Monday
    }
    public var stringValue: String {
        get {
            if self == .ALL {
                return "ALL"
            }
            return String(self.rawValue[self.rawValue.characters.index(self.rawValue.startIndex, offsetBy: 0)])
        }
    }
    public var title:String{
        get {
            if self == .ALL {
                return "ALL"
            }
            let string = String(self.rawValue.characters.prefix(3))
            return string.uppercased()
        }
        
    }
    
    public static var today:ENUM_WEEKDAY {
        get{
            
            return self.days.filter({ $0.mainValue == Date().component(.weekday)! - 1}).first ?? ENUM_WEEKDAY.Monday
            
        }
        
    }
    public var isToday: Bool {
        
        return  Date().toString(style: .weekday) == self.rawValue
        
        
    }
    
    
    
    public static let days = [Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday ]
    public static let days_with_All = [ALL,Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday]
    
}

