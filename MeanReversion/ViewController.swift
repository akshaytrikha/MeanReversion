//
//  ViewController.swift
//  MeanReversion
//
//  Created by Akshay Trikha on 16/3/18.
//  Copyright © 2018 ATronics. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class ViewController: UIViewController {
    
    var url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&outputsize=full&apikey=9NAAB553E9BR0QUR"
    var firstURLPart = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol="
    var secondURLPart = "&outputsize=full&apikey=9NAAB553E9BR0QUR"
    var stockSymbol = "MSFT"
    
    var fullHistory = false
    var date = "2018-03-16"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() {
        
        var fullURL = firstURLPart + stockSymbol + secondURLPart
        
        showLoadingHUD()
        
//        Alamofire.request("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=AAPL&apikey=9NAAB553E9BR0QUR").responseJSON { response in
        Alamofire.request(fullURL).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            
            if let jsonResult = response.result.value {
                let historyDictionary = jsonResult as! NSDictionary
                
                print(historyDictionary)
                
                let days = historyDictionary["Time Series (Daily)"] as! NSDictionary
                let dailyValues = days["2018-03-16"] as! NSDictionary
//                let open = dailyValues["1. open"]
//                let high = dailyValues["2. high"]
//                let low = dailyValues["3. low"]
//                let close = dailyValues["4. close"]
//                let volume = dailyValues["5. volume"]
//                print(open, high, low, close, volume)
                let currentData = [dailyValues["1. open"], dailyValues["2. high"], dailyValues["3. low"], dailyValues["4. close"], dailyValues["5. volume"]]
                
            } else {
                print("something went wrong")
            }
        }
        hideLoadingHUD()
    }
 
    private func showLoadingHUD() {
        // from Ray Wenderlich's tutorial, https://www.raywenderlich.com/156971/cocoapods-tutorial-swift-getting-started
        
//        let hud = MBProgressHUD.showAdded(to: contentView, animated: true)
//        hud.label.text = "Loading..."
    }
    
    private func hideLoadingHUD() {
//        MBProgressHUD.hide(for: contentView, animated: true)
    }


}
