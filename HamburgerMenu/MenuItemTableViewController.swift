//
//  MenuItemTableViewController.swift
//  HamburgerMenu
//
//  Created by Harvey Zhang on 12/4/15.
//  Copyright © 2015 HappyGuy. All rights reserved.
//

import UIKit

class MenuItemTableViewController: UITableViewController
{
    /*
    [ MenuItemDict ]
    
    MenuItemDict: ["image":String, "bigImage":String, "colors":Array]
    Array [Number, Number, Number]
    */
    private var menuItems = [MenuItem]()
    
    private func loadMenuItems()
    {
        let filePath = NSBundle.mainBundle().pathForResource("MenuItems", ofType: "plist")
        let orgDatas = NSArray(contentsOfFile: filePath!)
        if let orgArray = orgDatas
        {
            for dict in orgArray
            {
                let menuItem = MenuItem()
                menuItem.imageName = (dict.valueForKey("image") as? String)?.lowercaseString
                menuItem.bigImageName = (dict.valueForKey("bigImage") as? String)?.lowercaseString
                let tempArray = dict.valueForKey("colors") as? [Int]
                menuItem.bgColor = UIColor.rgbColor(tempArray![0], g: tempArray![1], b: tempArray![2])
                
                menuItems.append(menuItem)
            }
        }
        
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadMenuItems()
        (self.parentViewController?.parentViewController as? ViewController)?.menuItem = self.menuItems[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MenuItemTableViewCell

        // Configure the cell...
        cell.configureCell(menuItems[indexPath.row])

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return max(80.0, CGRectGetHeight(view.bounds) / CGFloat(menuItems.count))
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        (self.parentViewController?.parentViewController as? ViewController)?.menuItem = self.menuItems[indexPath.row]
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension UIColor {
    class func rgbColor(r: Int, g: Int, b: Int) -> UIColor {
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
}
