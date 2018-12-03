//
//  day_1.swift
//  AdventofCode
//
//  Created by Elisa Kazan on 2018-12-02.
//  Copyright © 2018 ElisaKazan. All rights reserved.
//

import Foundation

func day_1_part_1(){
    let filename = "/Users/elisakazan/sources/AdventofCode/Input/input_day1.txt"
    let input = try! String(contentsOfFile: filename)
    let array = input.components(separatedBy: "\n")
    
    var answer = 0
    
    for number in array{
        answer += Int(number)!
    }

    print("The answer for day 1 part 1 is: \(String(answer))")
}

func day_1_part_2(){
    let filename = "/Users/elisakazan/sources/AdventofCode/Input/input_day1.txt"
    let input = try! String(contentsOfFile: filename)
    let array = input.components(separatedBy: "\n")
    
    var freq = 0
    var map: [Int: Int] = [:]
    var answer = 0;
    var searching = true
    
    while(searching){
        for number in array{
            freq += Int(number)!
            
            if(map[freq] != nil){
                answer = freq
                searching = false;
                break;
            }
            else {
                map[freq] = 1;
            }
        }
    }
    print("The answer for day 1 part 2 is: \(String(answer))")
}



