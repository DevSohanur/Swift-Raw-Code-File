//
//  SlotReformatter.swift
//  Zaynax Health
//
//  Created by Sohanur Rahman on 18/2/21.
//

//  ViewController.swift
//  SlotReformat
//
//  Created by Sohanur Rahman on 17/2/21.
//  Copyright © 2021 Sohanur Rahman. All rights reserved.
//
import UIKit
struct RefinedSlot{
    var categorizedSlots: [ModelCategorizedSlots]
    
}
struct  ModelCategorizedSlots{
    var name: String
    var image: String
    var slots: [String]
}

class ViewController: UIViewController {
    var slots =  ["12:00AM-12:20AM", "12:20AM-12:40AM", "12:40AM-1:00AM", "1:00AM-1:20AM", "1:20AM-1:40AM", "1:40AM-2:00AM", "2:00AM-2:20AM", "2:20AM-2:40AM", "2:40AM-3:00AM", "3:00AM-3:20AM", "3:20AM-3:40AM", "3:40AM-4:00AM", "4:00AM-4:20AM", "4:20AM-4:40AM", "4:40AM-5:00AM", "5:00AM-5:20AM", "5:20AM-5:40AM", "5:40AM-6:00AM", "6:00AM-6:20AM", "6:20AM-6:40AM", "6:40AM-7:00AM", "7:00AM-7:20AM", "7:20AM-7:40AM", "7:40AM-8:00AM", "8:00AM-8:20AM", "8:20AM-8:40AM", "8:40AM-9:00AM", "9:00AM-9:20AM", "9:20AM-9:40AM", "9:40AM-10:00AM", "10:00AM-10:20AM", "10:20AM-10:40AM", "10:40AM-11:00AM", "11:00AM-11:20AM", "11:20AM-11:40AM", "11:40AM-12:00PM", "12:00PM-12:20PM", "12:20PM-12:40PM", "12:40PM-1:00PM", "1:00PM-1:20PM", "1:20PM-1:40PM", "1:40PM-2:00PM", "2:00PM-2:20PM", "2:20PM-2:40PM", "2:40PM-3:00PM", "3:00PM-3:20PM", "3:20PM-3:40PM", "3:40PM-4:00PM", "4:00PM-4:20PM", "4:20PM-4:40PM", "4:40PM-5:00PM", "5:00PM-5:20PM", "5:20PM-5:40PM", "5:40PM-6:00PM", "6:00PM-6:20PM", "6:20PM-6:40PM", "6:40PM-7:00PM", "7:00PM-7:20PM", "7:20PM-7:40PM", "7:40PM-8:00PM", "8:00PM-8:20PM", "8:20PM-8:40PM", "8:40PM-9:00PM", "9:00PM-9:20PM", "9:20PM-9:40PM", "9:40PM-10:00PM", "10:00PM-10:20PM", "10:20PM-10:40PM", "10:40PM-11:00PM", "11:00PM-11:20PM", "11:20PM-11:40PM", "11:40PM-12:00AM"]
    
    
    var hour = ""
    var AM_PM = ""
    
    var slotData: RefinedSlot!
    
    var morningSlots = [String]()
    var noonSlots = [String]()
    var eveningSlots = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for items in slots{
            
            let delimiter = "-"
            let delimitedString = items.components(separatedBy: delimiter)
            let item = delimitedString[0]
            
            if(item.count == 6){
                hour = "\(item[0])"
                AM_PM = "\(item[4 ..< 6])"
            }
            else{
                hour = "\(item[0 ..< 2])"
                AM_PM = "\(item[5 ..< 7])"
            }
            if(Int(hour)! >= 6 && Int(hour)! < 12 && AM_PM == "AM" ){
                morningSlots.append(items)
            }
            else if(Int(hour)! == 12 && AM_PM == "PM" || Int(hour)! < 4 && AM_PM == "PM"){
                noonSlots.append(items)
            }
            else if(Int(hour)! >= 4 && Int(hour)! < 8 && AM_PM == "PM"){
                eveningSlots.append(items)
            }
        }
        slotData = RefinedSlot(categorizedSlots: [ModelCategorizedSlots(name: "Morning", image: "morning", slots: morningSlots),
                                                  ModelCategorizedSlots(name: "Noon", image: "noon", slots: noonSlots),
                                                  ModelCategorizedSlots(name: "Evening", image: "evening", slots: eveningSlots)])
        print("Before Refined:\n \(slots) \n\nAfter Refined Data : \n \(slotData!)")
        
    }

}
extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
