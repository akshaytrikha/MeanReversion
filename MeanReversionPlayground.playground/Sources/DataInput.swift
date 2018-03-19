//
//  MeanReversionPlayground.playground
//  MeanReversion
//
//  Created by Akshay Trikha on 16/3/18.
//  Copyright © 2018 ATronics. All rights reserved.
//

import UIKit
import PlaygroundSupport
import Alamofire
import MBProgressHUD

// declaring an instance of this class to be used throughout the application
public var dataInputInstance = DataInput()

public class DataInput {
    
    public init () {
    }
    
    // creating a universal base view
    public let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: 400))
    
    // declaring elements on this page:
    
    public let stockSymbolLabel = UILabel()
//    public let normalButton = UIButton(type: .custom)
//    public let poissonButton = UIButton(type: .custom)
//    public let binomialButton = UIButton(type: .custom)
//    public let geometricButton = UIButton(type: .custom)
//    public let negBinomialButton = UIButton(type: .custom)

    public var url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&outputsize=full&apikey=9NAAB553E9BR0QUR"
    public var firstURLPart = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol="
    public var secondURLPart = "&outputsize=full&apikey=9NAAB553E9BR0QUR"
    public var stockSymbol = "AAPL"
    public var fullHistory = false
    public var date = "2018-03-19"
    
    public func getData() {
        
        var fullURL = firstURLPart + stockSymbol + secondURLPart
        
        showLoadingHUD()
        
        Alamofire.request(fullURL).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            print()
            
            if let jsonResult = response.result.value {
                let historyDictionary = jsonResult as! NSDictionary
                
                //                print(historyDictionary)
                
                let days = historyDictionary["Time Series (Daily)"] as! NSDictionary
                let dailyValues = days[self.date] as! NSDictionary
                let currentData = [dailyValues["1. open"], dailyValues["2. high"], dailyValues["3. low"], dailyValues["4. close"], dailyValues["5. volume"]]
                
                print("Current price for \(self.stockSymbol): \(currentData[3])")

            } else {
                print("something went wrong")
            }
        }
        hideLoadingHUD()
    }
    
    private func showLoadingHUD() {
//        // from Ray Wenderlich's tutorial, https://www.raywenderlich.com/156971/cocoapods-tutorial-swift-getting-started
//
//        let hud = MBProgressHUD.showAdded(to: view, animated: true)
//        //                hud.label.text = "Loading..."
        print("Loading...")
    }
    
    private func hideLoadingHUD() {
//        MBProgressHUD.hide(for: view, animated: true)
        print("Done loading...")
    }
    
    public func loadView(view: UIView) {
        
        // from old playground
        view.backgroundColor = UIColor(red: 4/255, green: 112/255, blue: 177/255, alpha: 1)
        
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        
        stockSymbolLabel.text = stockSymbol
        stockSymbolLabel.textColor = UIColor.white
        stockSymbolLabel.font = UIFont(name: "Helvetica-Light", size: 26.0)
        stockSymbolLabel.frame = CGRect(x: 0, y: 10, width: 250, height: 40)
        stockSymbolLabel.center.x = view.frame.width * 0.57
        
        
        
        
//        view.bounds.size.height = 400
//        view.bounds.size.width = 800
//        print(view.bounds.size.width)
        // ^^^ doesn't actually set frame dimensions ^^^
        
        let text = "Going through some basic improvements to a application I am working on. Still new to the iOS swift development scene. I figured that the lines of text in my code would automatically be centered because I set the label to center."
        //
        let customFont = UIFont(name: "AmericanTypewriter", size: 30)
        
//        let label = UILabel()
//        label.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        
        //        label.center = view.bounds.size.width * 0.5// doesn't work because view.width returns 0
        
//        label.center = CGPoint(x: 190, y: 100)
//        label.textAlignment = .center
//
//        label.text = stockSymbol
//        label.textColor = .black
//        label.font = customFont
        //        label.textAlignment = .left
        //        label.backgroundColor = .black
        //        label.attributedText = richText
        //
        //        label.numberOfLines = 1
        
        view.addSubview(stockSymbolLabel)
//        self.view = view
        
        getData()
    }
}
