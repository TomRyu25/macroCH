//
//  model.swift
//  macroCH
//
//  Created by tommy on 23/10/20.
//

import Foundation

struct User {
    var name: String = "username"
    var id: String = "userid"
    var gender: Int = 1
    var baju: Baju = .init()
    var size: Int = 1
    var badan: UkuranBadan = .init()
}

struct Baju {
    var name: String = "bajuname"
    var id: String = "bajuid"
    var action: Int = 1
    var measurement: UkuranBaju = .init()
    var condition: Condition = .init()
    var dateSaved: Date = Date()
    var processed: Int = 1
}

struct UkuranBaju {
    var shoulder: Int = 1
    var chest: Int = 1
    var back: Int = 1
    var waist: Int = 1
    var outstream: Int = 1
}

struct UkuranBadan {
    var shoulder: Int = 1
    var chest: Int = 1
    var back: Int = 1
    var waist: Int = 1
    var outstream: Int = 1
}

struct Condition {
    var hole: Bool = false
    var wearable: Bool = false
}

struct DonationRecieve {
    var name: String = "DonationRecieveName"
    var id: String = "DonationRecieveID"
    var location: Location = .init()
    var desc: String = "DonationRecieve"
    var phone: String = "01234567890"
    var needs: Needs = .init()
}

struct Location {
    var country: String = "Location"
    var city: String = "Location"
    var province: String = "Location"
    var postalcode: String = "Location"
    var address: String = "Location"
    var subDistrict: String = "Location"
    var note: String = "Location"
}

struct Needs {
    var item: Int = 1
    var desc: String  = "Location"
    var purpose: String = "Location"
}

struct News {
    var title: String = "News"
    var details: String = "News"
    var content: String = "News"
    var date: Date = .init()
}
