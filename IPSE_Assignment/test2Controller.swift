//
//  test2Controller.swift
//  IPSE_Assignment
//
//  Created by 扬 on 16/5/20.
//  Copyright © 2016年 扬. All rights reserved.
//
import CoreMotion
import UIKit

class test2Controller: UIViewController {

    var scoreTwo = Int()
    
    /**Use of Core Motion Framework
     to pop up hint for this question**/
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if(motion == .MotionShake)
        {
            
            
            let alert = UIAlertController(title: "Hint :", message: "Think about the difference between ++X and X++, the timing of addition", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "I Got It", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated:true, completion: nil)
            
        }
    }

    
    @IBAction func rightAnswer(sender: AnyObject) {
        scoreTwo += 20
        performSegueWithIdentifier("test2", sender: nil)
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
        let DestViewController : test3Controller = segue.destinationViewController as! test3Controller
        DestViewController.scoreThree = scoreTwo
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
