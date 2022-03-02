//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//
//import library Foundation
import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst()

// store calculation result and assign it as int.
var result: Int

// Validate input method, if true, do calculation.
if(Validation(input: args).validateInput())
{
    if(args.count == 1)
    {
        if(Int(args[0]) != nil)
        {
             print(Int(args[0])!)
        } else
        {
            // if numbers can't be detected, return
            Exception().invalidInput(error: "\(args[0])")
        }
     }
    
    
// method for multiple calculation.
    else if(args.count > 2){
        result = Calculator(args: args).returnResult();
        print(result);
    }
}
