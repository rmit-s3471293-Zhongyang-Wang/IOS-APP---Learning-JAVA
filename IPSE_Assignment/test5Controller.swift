//
//  test5Controller.swift
//  IPSE_Assignment
//
//  Created by 扬 on 16/5/20.
//  Copyright © 2016年 扬. All rights reserved.
//
import CoreMotion
import UIKit

class test5Controller: UIViewController {

    var scoreFive = Int()
    
    /**Use of Core Motion Framework
     to pop up hint for this question**/
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if(motion == .MotionShake)
        {
            
            
            let alert = UIAlertController(title: "Hint :", message: "When defining an array, you need to give a number for its holding space.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "I Got It", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated:true, completion: nil)
            
        }
    }
    
    @IBAction func rightAnswer(sender: AnyObject) {
        scoreFive += 20
        performSegueWithIdentifier("test5", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : testTotalController = segue.destinationViewController as! testTotalController
        DestViewController.scoreTotal = scoreFive
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
