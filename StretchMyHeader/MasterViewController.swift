//
//  MasterViewController.swift
//  StretchMyHeader
//
//  Created by Graeme Harrison on 2016-02-16.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
//    var objects = [AnyObject]()
    var objects = [NewsItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationItem.leftBarButtonItem = self.editButtonItem()
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
//        self.navigationItem.rightBarButtonItem = addButton
        
        navigationController?.navigationBarHidden = true
        
        
        createNews()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewWillAppear(animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
//        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func createNews() {
        let news1 = NewsItem(categ: "World", headline: "Climate change protests, divestments meet fossil fuels realities")
        let news2 = NewsItem(categ: "World", headline: "Climate change protests, divestments meet fossil fuels realities")
        let news3 = NewsItem(categ: "World", headline: "Climate change protests, divestments meet fossil fuels realities")
        let news4 = NewsItem(categ: "World", headline: "Climate change protests, divestments meet fossil fuels realities")
        let news5 = NewsItem(categ: "World", headline: "Climate change protests, divestments meet fossil fuels realities")
        objects.append(news1)
        objects.append(news2)
        objects.append(news3)
        objects.append(news4)
        objects.append(news5)

    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = segue.destinationViewController as! DetailViewController
                controller.detailItem = object
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as! NewsTableViewCell

        let newsItem = objects[indexPath.row]
        cell.categoryLabel.text = newsItem.categ
        cell.headlineLabel.text = newsItem.headline
        return cell
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

