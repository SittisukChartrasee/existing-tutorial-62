//
//  ViewController.swift
//  ios-custom
//
//  Created by Sittisuk Chartrasee on 5/29/20.
//  Copyright © 2020 Sittisuk Chartrasee. All rights reserved.
//

import UIKit
import React

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonNextPage(_ sender: Any) {
        NSLog("Hello")
//        let providerSettings = RCTBundleURLProvider.sharedSettings() // release
//        guard let jsCodeLocation = providerSettings?.jsBundleURL(forBundleRoot: "main.jsbundle", fallbackResource: nil) else { return } // release
        guard let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios") else { return  } // debug
        let mockData:NSDictionary = ["scores":
            [
                ["name":"Alex", "value":"42"],
                ["name":"Joel", "value":"10"]
            ]
        ]

        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "kaPVDMobile",
            initialProperties: mockData as [NSObject : AnyObject],
            launchOptions: nil
        )
        let vc = UIViewController()
        vc.view = rootView
        self.present(vc, animated: true, completion: nil)
    }
}

