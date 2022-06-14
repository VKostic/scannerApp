//
//  Company.swift
//  scannerApp
//
//  Created by Vladica Kostic on 14.6.22..
//

import Foundation

struct Company: Decodable {
    var id: String
    var type: String
    var color: String
    var imageUrl: URL
    var numberOfBlocks: Int
    var daysInPast: Int
    var blocked: Bool
}
