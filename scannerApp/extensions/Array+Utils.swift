//
//  Array+Utils.swift
//  scannerApp
//
//  Created by Vladica Kostic on 29.4.22..
//

import Vision
import Foundation

extension Array where Element == Quadrilateral {
    
    /// Finds the biggest rectangle within an array of `Quadrilateral` objects.
    func biggest() -> Quadrilateral? {
        let biggestRectangle = self.max(by: { (rect1, rect2) -> Bool in
            return rect1.perimeter < rect2.perimeter
        })
        
        return biggestRectangle
    }
    
}
