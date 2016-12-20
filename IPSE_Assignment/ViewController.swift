//
//  ViewController.swift
//  TableView
//
//  Created by 扬 on 16/4/6.
//  Copyright © 2016年 扬. All rights reserved.
//
import CoreMotion
import CoreData
import UIKit
import LocalAuthentication

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    var array = [postItem]()  //Add a new aray to contain posts
    
    /**Add new post to discussion board function**/
    func addNew(post: postItem) {
         array.append(post)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    /**TableView function with row define and contend loading**/
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as! myCell
        let post = array[indexPath.row]
        cell.textDisplay?.text = post.text
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       /**Add initial elements to discussion board for Testing*/
        array.append(postItem(text: "Example: How to Study Java?\ns3471293@student.rmit.edu.au"))
        array.append(postItem(text: "Example: How to turn Int into String?\nyoung90326@gmail.com"))
        array.append(postItem(text: "Example: This app is exciting!\n381289116@qq.com"))
       
       /**preparaing for Core Data Feching**/
        let appDel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context : NSManagedObjectContext = appDel.managedObjectContext
        
       /**Fetch element from CoreData and load them into discussion board tableview**/
     do{
            let request = NSFetchRequest(entityName: "Board")
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for items in results as! [NSManagedObject]{
                    let messages = items.valueForKey("message")
                    let post = postItem(text : messages as! String)
                    self.addNew(post)
                    //print(messages!)
                }
            }
        }
        catch{
            print("Data Loading failed")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

