//
//  MasterViewController.swift
//  StretchMyHeader
//
//  Created by Graeme Harrison on 2016-02-16.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var photoHeaderView: UIView!
    let kTableHeaderHeight : CGFloat = 305
    
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
        self.tableView.tableHeaderView = nil
        
        self.tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left:0, bottom:0, right:0)
        self.tableView.contentOffset = CGPointMake(0, -kTableHeaderHeight)
        tableView.addSubview(photoHeaderView)
        
        setupDate()
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
    
    func setupDate() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        let today = NSDate()
        let date = dateFormatter.stringFromDate(today)
        dateLabel.text = date
    }
    
    func createNews() {
        let news1 = NewsItem(categ: "World", headline: "Climate change protests, divestments meet fossil fuels realities")
        let news2 = NewsItem(categ: "Europe", headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")
        let news3 = NewsItem(categ: "Middle East", headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        let news4 = NewsItem(categ: "Africa", headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        let news5 = NewsItem(categ: "Asia Pacific", headline: "Despite UN ruling, Japan seeks backing for whale hunting")
        let news6 = NewsItem(categ: "Americas", headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        let news7 = NewsItem(categ: "World", headline: "South Africa in $40 billion deal for Russian nuclear reactors")
        let news8 = NewsItem(categ: "Europe", headline: "'One million babies' created by EU student exchanges")

        objects.append(news1)
        objects.append(news2)
        objects.append(news3)
        objects.append(news4)
        objects.append(news5)
        objects.append(news6)
        objects.append(news7)
        objects.append(news8)

    }
    
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
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
        
        switch newsItem.categ {
        case "World":
            cell.categoryLabel.textColor = UIColor.redColor()
        case "Americas":
            cell.categoryLabel.textColor = UIColor.blueColor()
        case "Europe":
            cell.categoryLabel.textColor = UIColor.greenColor()
        case "Middle East":
            cell.categoryLabel.textColor = UIColor.yellowColor()
        case "Africa":
            cell.categoryLabel.textColor = UIColor.orangeColor()
        case "Asia Pacific":
            cell.categoryLabel.textColor = UIColor.purpleColor()
            
        default: cell.categoryLabel.textColor = UIColor.blackColor()
        }
        
        return cell
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        photoHeaderView.frame = headerRect
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

