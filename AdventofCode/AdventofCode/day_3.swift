//
//  day_3.swift
//  AdventofCode
//
//  Created by Elisa Kazan on 2018-12-02.
//  Copyright © 2018 ElisaKazan. All rights reserved.
//

import Foundation

func day_3_part_1(){
    let filename = "/Users/elisakazan/sources/AdventofCode/Input/input_day3.txt"
    let input = try! String(contentsOfFile: filename)
    let array = input.components(separatedBy: "\n")
    let regex = try? NSRegularExpression(pattern: "#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)")
    var arr = Array(repeating: Array(repeating: ".", count: 10000), count: 10000)
    
    var answer = 0
    
    for plan in array{
        let range = NSRange(location: 0, length: plan.utf16.count)
        let match = regex?.firstMatch(in: plan, options: [], range: range)
        var id = 0
        var topEdge = 0
        var leftEdge = 0
        var width = 0
        var height = 0

        
        if let numberRange = Range((match?.range(at: 1))!, in: plan){
            id = Int(plan[numberRange])!
        }
        if let topRange = Range((match?.range(at: 2))!, in: plan){
            topEdge = Int(plan[topRange])!
        }
        if let leftRange = Range((match?.range(at: 3))!, in: plan){
            leftEdge = Int(plan[leftRange])!
        }
        if let wRange = Range((match?.range(at: 4))!, in: plan){
            width = Int(plan[wRange])!
        }
        if let hRange = Range((match?.range(at: 5))!, in: plan){
            height = Int(plan[hRange])!
        }
        
        for y in leftEdge...(leftEdge + height - 1){
            for x in topEdge...(topEdge + width - 1){
                if arr[x][y] == "X" {
                    // Already counted
                }
                else if arr[x][y] == "." {
                    // Not yet used
                    arr[x][y] = String(id)
                }
                else {
                    // Already used!
                    var id_2 = arr[x][y]
                    arr[x][y] = "X"
                    answer = answer + 1
                }
                
            }
        }
        
    }
    print("The answer for day 3 part 1 is: \(String(answer))")
}

func day_3_part_2(){
    let filename = "/Users/elisakazan/sources/AdventofCode/Input/input_day3.txt"
    let input = try! String(contentsOfFile: filename)
    let array = input.components(separatedBy: "\n")
    let regex = try? NSRegularExpression(pattern: "#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)")
    var arr = Array(repeating: Array(repeating: ".", count: 10000), count: 10000)
    
    var answers = Set<Int>()
    
    var answer = 0
    
    for plan in array{
        let range = NSRange(location: 0, length: plan.utf16.count)
        let match = regex?.firstMatch(in: plan, options: [], range: range)
        var id = 0
        var topEdge = 0
        var leftEdge = 0
        var width = 0
        var height = 0
        
        if let numberRange = Range((match?.range(at: 1))!, in: plan){
            id = Int(plan[numberRange])!
            answers.insert(id)
        }
        if let topRange = Range((match?.range(at: 2))!, in: plan){
            topEdge = Int(plan[topRange])!
        }
        if let leftRange = Range((match?.range(at: 3))!, in: plan){
            leftEdge = Int(plan[leftRange])!
        }
        if let wRange = Range((match?.range(at: 4))!, in: plan){
            width = Int(plan[wRange])!
        }
        if let hRange = Range((match?.range(at: 5))!, in: plan){
            height = Int(plan[hRange])!
        }
        
        for y in leftEdge...(leftEdge + height - 1){
            for x in topEdge...(topEdge + width - 1){
                if arr[x][y] == "X" {
                    // Already counted
                    answers = answers.filter { $0 != id }
                }
                else if arr[x][y] == "." {
                    // Not yet used
                    arr[x][y] = String(id)
                }
                else {
                    // Already used!
                    var overlapID = arr[x][y]
                    arr[x][y] = "X"
                    answer = answer + 1
                    // Remove Values
                    answers = answers.filter { $0 != id && $0 != Int(overlapID) }
                }
                
            }
        }
        
    }
    print("The answer for day 3 part 2 is: \(String(describing: answers))")
}



