//
//  ViewController.swift
//  F2HomeWork1
//
//  Created by Stephen on 11/9/14.
//  Copyright (c) 2014 Sherwood. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    var aPerson = [Person]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "\"Roster\""
        if let peopleFromArchive = self.loadFromArchive() as [Person]?
        {
            self.aPerson = peopleFromArchive
        }
        else
        {
            self.loadFromPlist()
            self.saveToArchive()
        }
    
        //self.loadFromPlist()
        self.tableView.dataSource = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.saveToArchive()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.aPerson.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath) as TableViewCell
        var personToDisplay = self.aPerson[indexPath.row]
        cell.name.text = personToDisplay.firstName
        cell.personImageView.image = personToDisplay.image
        
        return cell
    }
    
    func saveToArchive()
    {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        NSKeyedArchiver.archiveRootObject(self.aPerson, toFile: documentsPath + "/archive2")
    }
    
    func loadFromArchive() -> [Person]?
    {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as String
        
        if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive2") as? [Person]
        {
            return peopleFromArchive
        }
        return nil
    }
    
    func loadFromPlist()
    {
        let url = NSBundle.mainBundle().pathForResource("Names", ofType: "plist")
        let array = NSArray(contentsOfFile: url!)
        for object in array!
        {
            if let personDictionary = object as? NSDictionary
            {
                let firstName = personDictionary["First Name"] as String
                var thePerson = Person(firstName: firstName)
                self.aPerson.append(thePerson)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "SHOW_DETAIL"
        {
            let detailViewController = segue.destinationViewController as DetailViewController
            var selectedIndexPath = self.tableView.indexPathForSelectedRow()
            detailViewController.selection = self.aPerson[selectedIndexPath!.row]
        }
    }

}

