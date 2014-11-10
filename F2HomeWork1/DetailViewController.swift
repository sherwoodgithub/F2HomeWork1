//
//  DetailViewController.swift
//  F2HomeWork1
//
//  Created by Stephen on 11/9/14.
//  Copyright (c) 2014 Sherwood. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    var selectedPerson = Person(firstName: "John", lastName: "Doe")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = self.selectedPerson.returnsName()
        self.firstNameLabel.text = self.selectedPerson.firstName
        self.lastNameLabel.text = self.selectedPerson.lastName

        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
