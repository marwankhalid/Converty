//
//  BinaryDecimal.swift
//  Converty
//
//  Created by Marwan Khalid on 12/29/18.
//  Copyright © 2018 Marwan Khalid. All rights reserved.
//

import Foundation


class BinaryDecimal {
    
    var bits :[Int]?
    var bits22 :[Int]?
    var integer : Int?
    
    
    init(_ bits:[Int]) {
        self.bits = bits
    }
    
    init(_ decimal:Int) {
        self.integer = decimal
    }
    
    
    func CalculateBinaryValueFromInt() -> String {
        var newInt = integer!
        let rows = [128,64,32,16,8,4,2,1]
        var BinaryRows: [Int] = []
        for row in rows {
            let BinaryDigit = OneOrZero(forvalue: newInt, WithBitValue: row)
            BinaryRows.append(BinaryDigit)
            if BinaryDigit == 1 {
                newInt = newInt - row
            }
        }
        let StringFromIntArray = BinaryRows.map { String($0) }
        return StringFromIntArray.joined()
    }
    
    func CalculateIntValueForBinary() ->String{
        var value = 0
        var multiplier = 1
        guard let bits = bits else { fatalError() }
        for bit in bits.reversed() {
            let newValue = bit * multiplier
            value = value + newValue
            multiplier = multiplier * 2
        }
        return String(value)
        
    }
    
    func OneOrZero(forvalue Value:Int,WithBitValue BitValue: Int) -> Int{
        if Value - BitValue >= 0{
            return 1
        }
        else {
            return 0
        }
        
    }
    
    
}
