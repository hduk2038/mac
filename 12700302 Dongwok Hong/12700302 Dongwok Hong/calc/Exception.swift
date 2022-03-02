//
//  Exception.swift
//  calc
//
//  Created by Dongwok Hong on 12/3/21.
//  Copyright © 2021 UTS. All rights reserved.

import Foundation

// this struct handles all errors and return error messages to type
struct Exception
{
    enum CalculatorError: Error
    {
        //error types
        case emptyInput
        case divisionByZero
        case invalidNumber
        case invalidOperator
        case incompleteInput
        case invalidInput
    }

// this function checks for empty input and returns error.
func emptyInput()
{
    do {
        throw CalculatorError.emptyInput
    } catch
    {
        print("Error: missing input. ")
         exit(1)
    }
}

// this function checks for devision by zero and returns error when true.
func divisionByZero()
{
     do {
         throw CalculatorError.divisionByZero
     } catch
     {
        print("Error: Division by zero.")
          exit(2)
     }
 }

// this function checks for invalid number.
func invalidNumber(error : String)
{
     do
{
         throw CalculatorError.invalidNumber
     } catch
     {
         print("Error: Invalid number: \(error)")
         exit(3)
     }
 }

// this function checks for invalid operator.
func invalidOperator(error : String)
{
     do
{
         throw CalculatorError.invalidOperator
     } catch
     {
         print("Error: Unknown  \(error)")
         exit(4)
     }
 }

// this function checks for incomplete input.
func incompleteInput()
{
     do
{
         throw CalculatorError.incompleteInput
     } catch
     {
         print("Error: incomplete Input. ")
         exit(5)
     }
 }
    
// this function returns invalid input.
func invalidInput(error: String)
{
     do
 {
        throw CalculatorError.invalidInput
     } catch
     {
         print("Error: Invalid Input \(error)")
         exit(6)
     }
 }

}
