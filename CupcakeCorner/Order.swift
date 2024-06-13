//
//  Order.swift
//  CupcakeCorner
//
//  Created by Oliver Hu on 4/8/24.
//

import SwiftUI

@Observable
class Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }

    var streetAddress: String {
        didSet {
            UserDefaults.standard.set(streetAddress, forKey: "streetAddress")
        }
    }

    var city: String {
        didSet {
            UserDefaults.standard.set(city, forKey: "city")
        }
    }

    var zip: String {
        didSet {
            UserDefaults.standard.set(zip, forKey: "zip")
        }
    }
    
    var hasValidAddress: Bool {
        if name.isReallyEmpty || streetAddress.isReallyEmpty || city.isReallyEmpty || zip.isReallyEmpty {
            return false
        }

        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(type) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    init() {
        name = UserDefaults.standard.string(forKey: "name") ?? ""
        streetAddress = UserDefaults.standard.string(forKey: "streetAddress") ?? ""
        city = UserDefaults.standard.string(forKey: "city") ?? ""
        zip = UserDefaults.standard.string(forKey: "zip") ?? ""
    }
    
}
