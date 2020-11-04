//
//  model.swift
//  macroCH
//
//  Created by tommy on 23/10/20.
//

import Foundation

struct User {
    var name: String
    var id: String
    var gender: Int
    var baju: Baju
    var size: Int
    var badan: UkuranBadan
}

struct Baju {
    var name: String
    var id: Int
    var action: Int
    var measurement: UkuranBaju
    var condition: Condition
}

struct UkuranBaju {
    var shoulder: Int
    var chest: Int
    var back: Int
    var waist: Int
    var outstream: Int
}

struct UkuranBadan {
    var shoulder: Int
    var chest: Int
    var back: Int
    var waist: Int
    var outstream: Int
}

struct Condition {
    var hole: Bool
    var wearable: Bool
}

struct DonationRecieve {
    var name: String
    var id: String
    var location: Location
    var desc: String
    var phone: String
    var needs: Needs
}

struct Location {
    var country: String
    var city: String
    var province: String
    var postalcode: String
    var address: String
    var subDistrict: String
    var note: String
}

struct Needs {
    var item: Int
    var desc: String
    var purpose: String
}

struct News {
    var title: String
    var details: String
    var content: String
    var date: Date
}
