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
    
    
//    // MARK: - Instance Properties
//    public var days: [Flavor] = []
//    fileprivate let flavorFactory = FlavorFactory()
//
//    // MARK: - Outlets
//    @IBOutlet var contentView: UIView!
//    @IBOutlet var collectionView: UICollectionView!
//    @IBOutlet var iceCreamView: IceCreamView!
//    @IBOutlet var label: UILabel!

    

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
        
        showLoadingHUD()
        
        let url = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&outputsize=full&apikey=9NAAB553E9BR0QUR"); // with API key added
        
//        Alamofire.request(url)
        
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
