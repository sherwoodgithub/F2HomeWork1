//
//  ViewController.swift
//  F2HomeWork1
//
//  Created by Stephen on 11/9/14.
//  Copyright (c) 2014 Sherwood. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    var myPeeps = [Person]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Home"
        
        var scroogeMcDuck = Person(firstName: "Scrooge", lastName: "McDuck")
        var darthVader = Person(firstName: "Darth", lastName: "Vader")
        var dickCheney = Person(firstName: "Dick", lastName: "Cheney")
        var noodleHead = Person(firstName: "Noodle", lastName: "Head")
        self.myPeeps = [scroogeMcDuck,darthVader,dickCheney,noodleHead]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
                
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.myPeeps.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath) as UITableViewCell
        
        var personToDisplay = self.myPeeps[indexPath.row]
        cell.textLabel.text = personToDisplay.returnsName()
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "SHOW_DETAIL"
        {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var personToPass = self.myPeeps[selectedIndexPath!.row]
            detailViewController.selectedPerson = personToPass
        }
    }
}

