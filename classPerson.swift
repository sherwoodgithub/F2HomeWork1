//
//  classPerson.swift
//  F2HomeWork1
//
//  Created by Stephen on 11/9/14.
//  Copyright (c) 2014 Sherwood. All rights reserved.
//

import Foundation

class Person
{
    var firstName: String
    var lastName: String
    
    init() {
        self.firstName = "John"
        self.lastName = "Doe"
    }
    
    init (firstName: String, lastName: String)
    {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    //returns full name, first+last
    func returnsName()->String
    {
        //return self.firstName+self.lastName
        return "\(self.firstName) \(self.lastName)"
        
    }
}