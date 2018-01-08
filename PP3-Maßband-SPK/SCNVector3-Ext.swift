//
//  SCNVector3-Ext.swift
//  PP3-Maßband-SPK
//
//  Created by Lorenz Kock on 05.01.18.
//  Copyright © 2018 Lorenz Kock. All rights reserved.
//

import Foundation
import SceneKit

extension SCNVector3 : Equatable {
    
    public static func ==(lhs: SCNVector3, rhs: SCNVector3) -> Bool {
        return (lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z)
    }
    
    func distance(to vector : SCNVector3) -> Float {
        
        let dX = self.x - vector.x
        let dY = self.y - vector.y
        let dZ = self.z - vector.z
        
        return sqrtf(dX * dX + dY * dY + dZ * dZ)
    }
    
    
}
