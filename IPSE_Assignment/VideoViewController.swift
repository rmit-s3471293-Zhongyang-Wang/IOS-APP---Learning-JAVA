//
//  VideoViewController.swift
//  IPSE_Assignment
//
//  Created by 扬 on 16/5/22.
//  Copyright © 2016年 扬. All rights reserved.
//

import UIKit
import LocalAuthentication

class VideoViewController: UIViewController {
    
    /**a array of string used for contain video id fetched from youtube api**/
    var videoID = [String]()
    var index:Int = 0

    @IBOutlet var videoView: UIWebView!     //webview outlet used to play the video
    
    /**a button to get next video from playlist**/
    @IBAction func nextVideo(sender: AnyObject) {
     
    if(index<videoID.count){
        
       let nextVideoId:String = videoID[index++]
        
       videoView.loadHTMLString("<iframe width=\"\(videoView.frame.width)\" height=\"\(videoView.frame.height)\" src=\"https://www.youtube.com/embed/"+nextVideoId+"\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        }
    }
    
    
    let apiKey = "AIzaSyAKYxf9GFeU3aBpD_RHa__1KNZDui0fZO8"    //API KEY used for Youtube API V3
    
    let PlayListId = "PLFE2CE09D83EE3E28"    //a playlist of JAVA tutirial videos
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //verify identity by touchId
        authoriseWithTouchID()
        
        /**laod the first video for testing**/
       videoView.loadHTMLString("<iframe width=\"\(videoView.frame.width)\" height=\"\(videoView.frame.height)\" src=\"https://www.youtube.com/embed/Hl-zzrqQoSE?list=PLFE2CE09D83EE3E28\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        /***Use API KEY and playlist to fetch java tutorial video from youtube*/
        let youtubeApi =  "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(PlayListId)&key=\(apiKey)"
        let url = NSURL(string: youtubeApi)
        
        /**Create video fetch request**/
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? [String : AnyObject]
                {
                   /**manipulation of JSON file returned, find the value of video id and save them into array of String**/
                    if let items = jsonResult["items"] as? [AnyObject]? {
                        
                        for(var i:Int = 1; i<5;i++){
                        
                            let snippet = items?[i]["snippet"]
                            let resourceId = snippet?!["resourceId"]
                            let videoid = resourceId?!["videoId"]
                            var myString = String(videoid)
                            myString = myString.stringByReplacingOccurrencesOfString("Optional(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                            myString = myString.stringByReplacingOccurrencesOfString(")", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                            self.videoID.append(myString)
                        
                        }       
                    }
                }
            }
            catch {
                print("json error: \(error)")
            }
        })
        // Start the request
        task.resume()
    }
    
    /**function of identity check via touchId**/
    func authoriseWithTouchID()
    {
        let authContext = LAContext()
        let authReason = "Sign in with TouchID"
        var authError: NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &authError)
        {
            authContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: authReason, reply: {(success, error)->Void in
                if success{
                    let alert = UIAlertController(title: "Sign in successful", message:"", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alert.addAction(UIAlertAction(title: "Cool", style: UIAlertActionStyle.Default, handler: nil))
                    
                    self.presentViewController(alert, animated:true, completion: nil)
                }
            })
        }
        else
        {
            print(authError?.localizedDescription)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
