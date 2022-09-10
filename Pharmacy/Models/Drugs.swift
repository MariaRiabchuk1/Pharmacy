//
//  Drugs.swift
//  Pharmacy
//
//  Created by Oleksandr Riabchuk on 10.09.2022.
//

import Foundation

public struct Drugs: Equatable, Hashable {
    
    let name: String
    let image: String
    let description: String
    var totalCount: Int
    var dvCount: Int
    var edaCount: Int
    var edsCount: Int
    var fvCount: Int
    var ivCount: Int
    var nvCount: Int
    var pgvCount: Int
    var pvCount: Int
    var rvCount: Int
    var trvCount: Int
    var tvCount: Int
    var vaitCount: Int
    var vpdCount: Int
    var xvCount: Int
    
    public init(name: String, image: String, description: String, totalCount: Int, dvCount: Int, edaCount: Int, edsCount: Int, fvCount: Int, ivCount: Int, nvCount: Int, pgvCount: Int, pvCount: Int, rvCount: Int, trvCount: Int, tvCount: Int, vaitCount: Int, vpdCount: Int, xvCount: Int) {
        self.name = name
        self.image = image
        self.description = description
        self.totalCount = totalCount
        self.dvCount = dvCount
        self.edaCount = edaCount
        self.edsCount = edsCount
        self.fvCount = fvCount
        self.ivCount = ivCount
        self.nvCount = nvCount
        self.pgvCount = pgvCount
        self.pvCount = pvCount
        self.rvCount = rvCount
        self.trvCount = trvCount
        self.tvCount = tvCount
        self.vaitCount = vaitCount
        self.vpdCount = vpdCount
        self.xvCount = xvCount
    }
    
    
}
