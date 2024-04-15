//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name : String {get}
    func price() -> Int
    
}

class Item: SKU {
    var _name: String
    var name: String {
        get {
            return self.name
        }
        set {
            self.name = _name
        }
    }
    var priceTag: Int
    init(_ name: String, _ price: Int) {
        _name = name
        self.priceTag = price
    }
    func price() -> Int {
        return self.priceTag
    }
}

class Receipt {
    var itemList: [Item]
    
    init(_ skuList: [Item]) {
        self.itemList = skuList
    }
    init() {
        self.itemList = []
    }
    
    func items() -> [SKU] {
        return self.itemList
    }
    func output() {
        for item in self.itemList {
            print(item.name)
        }
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
    func subtotal() {
        return
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

