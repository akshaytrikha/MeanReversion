//
//  Day.swift
//  
//
//  Created by Akshay Trikha on 16/3/18.
//

import Foundation
import UIKit

// MARK: - FlavorAdapter
protocol DayAdapter {
    func update(with day: Day)
}

// MARK: - Flavor
public struct Day {
    
    // MARK: - Static Properties
    public static var today: Day {
        return Day(date: "3/16/18", dailyOpen: "0.0", dailyHigh: "0.0", dailyLow: "0.0", dailyClose: "0.0", dailyVolume: "0.0")
    }
//
//    public static var vanilla: Flavor {
//        return Flavor(name: "Vanilla", topColor: RGB(251, 248, 236), bottomColor: RGB(230, 215, 171))
//    }
    
    // MARK: - Instance Properties
    public let date: String
    public let dailyOpen: String
    public let dailyHigh: String
    public let dailyLow: String
    public let dailyClose: String
    public let dailyVolume: String
    
    // MARK: - Object Lifecycle
    public init?(dictionary: [String: String]) {
        guard let date = dictionary["date"],
            let dailyOpen = dictionary["dailyOpen"], // need to convert output Strings to Doubles
            let dailyHigh = dictionary["dailyHigh"],
            let dailyLow = dictionary["dailyLow"],
            let dailyClose = dictionary["dailyClose"],
            let dailyVolume = dictionary["dailyVolume"]
            
//            let topColor = UIColor(rgbaString: topColorString),
//            let bottomColor = UIColor(rgbaString: bottomColorString)

            else {
                return nil
        }
        
        self.init(date: date, dailyOpen: dailyOpen, dailyHigh: dailyHigh, dailyLow: dailyLow, dailyClose: dailyClose, dailyVolume: dailyVolume)
    }
    
    public init(date: String, dailyOpen: String, dailyHigh: String, dailyLow: String, dailyClose: String, dailyVolume: String) {
        self.date = date
        self.dailyOpen = dailyOpen
        self.dailyHigh = dailyHigh
        self.dailyLow = dailyLow
        self.dailyClose = dailyClose
        self.dailyVolume = dailyVolume
    }
}


