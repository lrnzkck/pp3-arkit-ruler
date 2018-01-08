//
//  Measure.swift
//  PP3-Maßband-SPK
//
//  Created by Lorenz Kock on 05.01.18.
//  Copyright © 2018 Lorenz Kock. All rights reserved.
//

import Foundation
import SceneKit
import UIKit
import ARKit

class Measure {
    
    var startPoint : SCNVector3
    var startNode : SCNNode
    var endNode : SCNNode
    var lineNode : SCNNode?
    var sceneView : SCNView
    
    
    init(with startPoint : SCNVector3, sceneView : ARSCNView) {
        self.startPoint = startPoint
        
        self.sceneView = sceneView
        
        let point = SCNSphere(radius: 1)
        point.firstMaterial?.diffuse.contents = UIColor.red
        point.firstMaterial?.lightingModel = .constant
        point.firstMaterial?.isDoubleSided = true
        
        self.startNode = SCNNode(geometry: point)
        self.startNode.scale = SCNVector3(1/400.0,1/400.0,1/400.0)
        self.startNode.position = self.startPoint
        sceneView.scene.rootNode.addChildNode(self.startNode)
        
        self.endNode = SCNNode(geometry: point)
        self.endNode.scale = SCNVector3(1/400.0,1/400.0,1/400.0)
        
        
    }
    
    func update(with endPoint : SCNVector3) {
        self.endNode.position = endPoint
        self.sceneView.scene?.rootNode.addChildNode(self.endNode)
        
        self.lineNode?.removeFromParentNode()
        
        let indices: [UInt32] = [0,1]
        let source = SCNGeometrySource(vertices: [self.startPoint, endPoint])
        let element = SCNGeometryElement(indices: indices, primitiveType: .line)
        let geometry = SCNGeometry(sources: [source], elements: [element])
        geometry.firstMaterial?.diffuse.contents = UIColor.red
        
        self.lineNode = SCNNode(geometry: geometry)
        self.sceneView.scene?.rootNode.addChildNode(self.lineNode!)
        
    }
    
}
