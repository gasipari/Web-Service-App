//
//  ViewController.swift
//  Web Service Example
//
//  Created by Marius on 5/6/15.
//  Copyright (c) 2015 Marius Mukunzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         let manager = AFHTTPRequestOperationManager()
        
        manager.GET( "http:/graph.facebook.com/bobdylan",
            parameters: nil,
            success: /* begin of closure ?? */{ (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                /* begin of closure ?? */
                println("Response: " + responseObject.description)
                
                if let myName = responseObject["name"] as? String {
                    self.myNameLabel.text = myName
                }
                
            }, /* end of closure */
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

