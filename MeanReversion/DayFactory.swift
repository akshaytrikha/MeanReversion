//
//  DayFactory.swift
//  MeanReversion
//
//  Created by Akshay Trikha on 17/3/18.
//  Copyright © 2018 ATronics. All rights reserved.
//

import Foundation

//public class DayFactory {
//    
//    public func daysFromPlist(named plistName: String, in bundle: Bundle = Bundle.main) -> [Day] {
//        let path = bundle.path(forResource: plistName, ofType: "plist")!
//        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
//        let options = PropertyListSerialization.MutabilityOptions()
//        let array = try! PropertyListSerialization.propertyList(from: data, options: options, format: nil) as! [[String: String]]
//        return days(from: array)
//    }
//    
//    public func days(from dictionaryArray: [[String: String]]) -> [Day] {
//        var days: [Day] = []
//        for dictionary in dictionaryArray {
//            if let day = Day(dictionary: dictionary) {
//                days.append(day)
//            }
//        }
//        return days
//    }
//}

