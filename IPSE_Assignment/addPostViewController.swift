//
//  addPostViewController.swift
//  TableView
//
//  Created by 扬 on 16/4/7.
//  Copyright © 2016年 扬. All rights reserved.
//
import CoreData
import UIKit

class addPostViewController: UIViewController {
    

    @IBOutlet weak var textField: UITextView!
    
    
    /**click post button to save message into core data*/
    @IBAction func postNew(sender: UIBarButtonItem) {
        
        let appDel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context : NSManagedObjectContext = appDel.managedObjectContext
        let newPost = NSEntityDescription.insertNewObjectForEntityForName("Board", inManagedObjectContext: context)
        newPost.setValue(textField.text, forKey: "message")
        
        do{
           try context.save()
        }
        catch{
           print("Something wrong with data saving")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
