//
//  classPerson.swift
//  F2HomeWork1
//
//  Created by Stephen on 11/9/14.
//  Copyright (c) 2014 Sherwood. All rights reserved.
//

import Foundation
import UIKit


class Person: NSObject, NSCoding
{
    var firstName: String
    var lastName: String
    var image: UIImage?
    
    init(firstName: String)
    {
        self.firstName = firstName
        self.lastName = "Jameson"
    }
    
    required init(coder decoder: NSCoder)
    {
        self.firstName = decoder.decodeObjectForKey("firstName") as String
        self.lastName = decoder.decodeObjectForKey("lastName") as String
        if let decodedImage = decoder.decodeObjectForKey("image") as? UIImage
        {
            self.image = decodedImage
        }
    }
    
    func encodeWithCoder(coder: NSCoder)
    {
        coder.encodeObject(self.firstName, forKey: "firstName")
        coder.encodeObject(self.lastName, forKey: "lastName")
        if self.image != nil
        {
            coder.encodeObject(self.image!, forKey: "image")
        } else {
            coder.encodeObject(nil, forKey: "image")
        }
    }
}