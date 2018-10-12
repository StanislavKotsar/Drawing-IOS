

import UIKit

@IBDesignable
class ThermometerView: UIView {
  let thermoLayer = CAShapeLayer()
  let levelLayer = CAShapeLayer()
  let maskLayer = CAShapeLayer()

  var lineWidth: CGFloat {
    return bounds.width / 3
  }
  
  @IBInspectable var level: CGFloat = 0.5 {
    didSet {
      if level < 0.5 {
        thermoLayer.fillColor = UIColor.red.cgColor
      } else {
        thermoLayer.fillColor = UIColor.green.cgColor
      }
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }
  
  private func setup() {
    layer.addSublayer(thermoLayer)
    layer.addSublayer(levelLayer)
    let width = bounds.width - lineWidth
    let height = bounds.height - lineWidth / 2
    let path = UIBezierPath(ovalIn: CGRect(x: 0, y: height-width, width: width, height: width))
    path.move(to: CGPoint(x: width / 2, y: height - width))
    path.addLine(to: CGPoint(x: width / 2, y: 10))
    thermoLayer.path = path.cgPath
    thermoLayer.strokeColor = UIColor.darkGray.cgColor
    thermoLayer.lineWidth = width / 3
    thermoLayer.position.x = lineWidth / 2
    thermoLayer.lineCap = kCALineCapRound
    
    maskLayer.path = thermoLayer.path
    maskLayer.lineWidth = thermoLayer.lineWidth
    maskLayer.lineCap = thermoLayer.lineCap
    maskLayer.position = thermoLayer.position
    maskLayer.strokeColor = thermoLayer.strokeColor
    maskLayer.lineWidth = thermoLayer.lineWidth - 6
    maskLayer.fillColor = nil
    
    buildLevelLayer()
    
    levelLayer.mask = maskLayer
    
    let pan = UIPanGestureRecognizer(target: self,
                                     action: #selector(handlePan(gesture:)))
    addGestureRecognizer(pan)
  }
  
  private func buildLevelLayer() {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: bounds.midX, y: bounds.height))
    path.addLine(to: CGPoint(x: bounds.midX, y: 0))
    levelLayer.strokeColor = UIColor.white.cgColor
    levelLayer.path = path.cgPath
    levelLayer.lineWidth = bounds.width
    levelLayer.strokeEnd = level
  }
  
  @objc func handlePan(gesture: UIPanGestureRecognizer) {
    let translation = gesture.translation(in: gesture.view)
    let percent = translation.y / bounds.height
    
    level = max(0, min(1, levelLayer.strokeEnd - percent))
    
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    levelLayer.strokeEnd = level
    CATransaction.commit()
    
    gesture.setTranslation(.zero, in: gesture.view)
  }
}
























