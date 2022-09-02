//
//  Model.swift
//  UIKitLes7_SegmentControl
//
//  Created by Diana on 30/08/2022.
//

import Foundation


struct ModelAdidas {
    let name: String
    let price: Double
    let images: [String]
}

class AdidasBoots {
    var boots: [ModelAdidas] = []
    
    init() {
        setup()
    }
    
    private func setup() {
        let ozeliaBoots = ModelAdidas(name: "OZELIA", price: 499.0, images: ["ad1.0", "ad1.1", "ad1.2", "ad1.3"])
        let ultraboostBoots = ModelAdidas(name: "ULTRABOOST", price: 749.0, images: ["ad2.0", "ad2.1", "ad2.2", "ad2.3"])
        let zx22BoostBoots = ModelAdidas(name: "ZX22BOOST", price: 549.0, images: ["ad3.0", "ad3.1", "ad3.2", "ad3.3"])
        let nmd_R1Boots = ModelAdidas(name: "NMD_R1", price: 649.0, images: ["ad4.0", "ad4.1", "ad4.2", "ad4.3"])
        
        boots.append(ozeliaBoots)
        boots.append(ultraboostBoots)
        boots.append(zx22BoostBoots)
        boots.append(nmd_R1Boots)
    }
}
