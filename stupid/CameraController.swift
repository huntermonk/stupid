import SpriteKit
import ARKit

class CameraController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!

    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.showsStatistics = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.session.run(ARWorldTrackingConfiguration())
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addAtHit(touches: touches)
    }

    private func addAtHit(touches: Set<UITouch>) {
        addAnchor(distance: 2, camera: sceneView.session.currentFrame!.camera.transform)
        sceneView.removeAnchors()
    }

    private func addAnchor(distance: Float, camera: matrix_float4x4) {
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -distance
        let transform = simd_mul(camera, translation)

        let anchor = ARAnchor(transform: transform)
        sceneView.session.add(anchor: anchor)
    }

}

extension CameraController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode.brazzers

        let constraint = SCNBillboardConstraint()
        constraint.freeAxes = SCNBillboardAxis.Y

        node.constraints = [constraint]
        return node
    }
}
