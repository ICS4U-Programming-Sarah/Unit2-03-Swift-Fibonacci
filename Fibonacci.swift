// This program reads information from line,
// it uses recursion to determine fibonacci
// sequences.

//
//  Created by Sarah Andrew

//  Created on 2023-04-19

//  Version 1.0

//  Copyright (c) 2023 Sarah. All rights reserved.
import Foundation

// Define input & output paths.
let inputFile = "input.txt"
let outputFile = "output.txt"

// Usage of file handle method to locate files,
// as well as opening input for file reading.
do {
    // Open input file for reading.
    guard let input = FileHandle(forReadingAtPath: inputFile) else {
        print("Error: cannot access input file for opening.")
        exit(1)
    }

    // Open output file for writing.
    guard let output = FileHandle(forWritingAtPath: outputFile) else {
        print("Error: cannot access output file for opening.")
        exit(1)
    }

    // Read context for file.
    let inputData = input.readDataToEndOfFile()

    // Convert data to a string.
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Error: Cannot convert input data to string.")
        exit(1)
    }

    // Split string into lines, ensuring reading empty line.
    let inputLines = inputString.components(separatedBy: .newlines)

    // Usage of loop to access each element.
    for str in inputLines {
        if let aNum = Int(str) {
            // If statement, checking for
            // positive values. 
            if aNum >= 0 {
                // Call function.
                let recFib = recFibonacci(aNum: aNum)
                
                // Display to user & write to console.
                print("The fibonacci sequence of", str, terminator: "")
                print(" is", recFib)

                // Writes to output file.
                let data1 = Data(("The fibonacci sequence of " + str).utf8)
                output.write(data1)
                let data2 = Data((" is " + String(recFib) + "\n").utf8)
                output.write(data2)

            } else {
                // Displays error to user,
                // as well as writing to file.
                print("Positive values only.")
                let data3 = Data(("Positive values only." + "\n").utf8)
                output.write(data3)
            }
        
        } else {
            // Display error to user, as well as
            // writing to file.
            print("Please enter valid input.")
            let data4 = Data(("Please enter valid input." + "\n").utf8)
            output.write(data4)
        }

    }

    // Close input & output file.
    input.closeFile()
    output.closeFile()

}
// This function uses recursion to
// calculate determine fibonacci sequence.
func recFibonacci(aNum: Int) -> Int {
    // Calculates fibonacci
    // sequence.
    // Define base cases
    if aNum == 0 {
        // Return to main
        return 0
    } else if aNum == 1 {
        // Return to main.
        return 1
    } else {
        // Calls function recursively.
        return recFibonacci(aNum: aNum - 1) + recFibonacci(aNum: aNum - 2)

    }
}
