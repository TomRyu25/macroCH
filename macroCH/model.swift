//
//  model.swift
//  macroCH
//
//  Created by tommy on 23/10/20.
//

import Foundation

struct user {
    var name: String
    var id: String
    var gender: Int
    var baju: Data
    var size: Int
    var badan: Data
}

struct baju {
    var name: String
    var id: Int
    var action: Int
    var measurement: Data
    var condition: Data
}

struct ukuranBaju {
    var shoulder: Int
    var chest: Int
    var back: Int
    var waist: Int
    var outstream: Int
}

struct ukuranBadan {
    var shoulder: Int
    var chest: Int
    var back: Int
    var waist: Int
    var outstream: Int
}

struct condition {
    var hole: Bool
    var wearable: Bool
}
