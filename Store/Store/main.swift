//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name : String { get }
    func price() -> Int
    
}

class Item: SKU {
    var name: String
    private var priceTag: Int
    init(name: String, priceEach: Int) {
        self.name = name
        self.priceTag = priceEach
    }
    func price() -> Int {
        return self.priceTag
    }
}

class Receipt {
    private var itemList: [Item]
    
    init(_ skuList: [Item]) {
        self.itemList = skuList
    }
    init() {
        self.itemList = []
    }
    
    func items() -> [SKU] {
        return self.itemList
    }
    
    func total() -> Int {
        var sum = 0
        for item in self.itemList {
            sum += item.price()
        }
        return sum
    }
    
    func output() -> String {
        var shoppedList = ""
        for item in self.itemList {
            shoppedList += ("\n\(item.name): $\(Double(item.price()) / 100.0)")
        }
        let output = """
Receipt:\(shoppedList)
------------------
TOTAL: $\(Double(self.total()) / 100.0)
"""
        return output
    }
    
    func add(_ item: Item) {
        self.itemList.append(item)
    }
}

class Register {
    var receipt: Receipt
    init() {
        self.receipt = Receipt()
    }
    
    func scan(_ item: Item) {
        receipt.add(item)
    }
    func subtotal() -> Int {
        return receipt.total()
    }
    func total() -> Receipt {
        let tempReceipt = self.receipt
        self.receipt = Receipt()
        return tempReceipt
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

