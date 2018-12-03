//
//  day_2.swift
//  AdventofCode
//
//  Created by Elisa Kazan on 2018-12-02.
//  Copyright © 2018 ElisaKazan. All rights reserved.
//

import Foundation

func day_2_part_1() {
    let filename = "/Users/elisakazan/sources/AdventofCode/Input/input_day2.txt"
    let input = try! String(contentsOfFile: filename)
    let array = input.components(separatedBy: "\n")
    
    // The number of Box IDs with two or three repeating letters
    var twos = 0
    var threes = 0
    
    for var id in array {
        var map: [Character: Int] = [:]
        for letter in id {
            map[letter] == nil ? (map[letter] = 1) : (map[letter] = map[letter]! + 1)
        }
        
        let values = map.values
        var two = false;
        var three = false;
        
        for v in values{
            if v == 2 {
                two = true
            } else if v == 3 {
                three = true
            }
        }
        
        if two { twos += 1 }
        if three { threes += 1 }
    }
    
    print("The answer for day 2 part 1 is: \(String(twos * threes))")
}

func day_2_part_2() {
    let filename = "/Users/elisakazan/sources/AdventofCode/Input/input_day2.txt"
    let input = try! String(contentsOfFile: filename)
    let array = input.components(separatedBy: "\n")
    
    outerloop: for first_word in array{
        for second_word in array{
            if first_word != second_word {
                var matching = 0;
                let total = first_word.count
                let arr1 = Array(first_word)
                let arr2 = Array(second_word)
                
                for i in 0...total-1{
                    if arr1[i] == arr2[i]{
                        matching += 1
                    }
                }
                
                if matching+1 == total {
                    print("The answer for day 2 part 2 is: \(first_word) and \(second_word)")
                    break outerloop
                }
                
            }
        }
    }
}
