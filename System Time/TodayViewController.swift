//
//  TodayViewController.swift
//  System Time
//
//  Created by 扬 on 16/5/14.
//  Copyright © 2016年 扬. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    var timer = NSTimer()
    var hour :Int = 0
    var minute : Int = 0
    var second : Int = 0
    var timeString : String = ""
    
    @IBOutlet weak var timeLabel: UILabel!
   
    /**used to open app by clicking button*/
    @IBAction func openApp(sender: AnyObject) {
        
        let url: NSURL? = NSURL(string: "javatime://recent")!
        extensionContext?.openURL(url!, completionHandler: nil)
    }
   
    
    func updateTime(){
        second+=1
        if second == 60{
        minute+=1
        second = 0
        }
        if minute == 60{
        hour+=1
            minute = 0
        }
        let secondString = second > 9 ? "\(second)" : "0\(second)"
        let minuteString = minute > 9 ? "\(minute)" : "0\(minute)"
        let hourString = hour > 9 ? "\(hour)" : "0\(hour)"
        
        timeLabel.text = "\(hourString):\(minuteString):\(secondString)"
    }

    func widgetMarginInsetsForProposedMarginInsets
        (defaultMarginInsets: UIEdgeInsets) -> (UIEdgeInsets) {
            return UIEdgeInsetsZero
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
