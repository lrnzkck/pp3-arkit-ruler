import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!

    @IBAction func resetButton(_ sender: Any) {
        for measure in measures {
            measure.startNode.removeFromParentNode()
            measure.endNode.removeFromParentNode()
            measure.lineNode?.removeFromParentNode()
        }
        self.measures.removeAll()
    }
    
    var initialized = false
    var measuring = false
    
    var measures = [Measure]()
    var actualMeasure : Measure?
    
    var startPoint = SCNVector3()
    var endPoint = SCNVector3()
    var zeroPoint = SCNVector3()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.text = "Die Welt wird gescannt.."
        imageView.image = UIImage(named: "WhiteTarget")
        
        sceneView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if initialized {
            if measuring {
                measuring = false
                
                if let measure = actualMeasure {
                    measures.append(measure)
                    actualMeasure = nil
                }
                
            } else {
                // reset to start new Measure
                self.startPoint = SCNVector3()
                self.endPoint = SCNVector3()
                
                measuring = true
            }
        }
    }
    
    tran
    

    
}
