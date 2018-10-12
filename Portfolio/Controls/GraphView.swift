

import UIKit

@IBDesignable
class GraphView: UIView {
  
  var days: [CGFloat] = [4, 3, 0, 6, 5, 10, 8]
  
  // number of y axis labels
  let yDivisions: CGFloat = 5
  // margin between lines
  lazy var gap: CGFloat = {
    return bounds.height / (yDivisions + 1)
  }()
  // averaged value spread over y Divisions
  lazy var eachLabel: CGFloat = {
    let maxValue = CGFloat(days.max()!)
    let minValue = CGFloat(days.min()!)
    return (maxValue - minValue) / (yDivisions-1)
  }()
  // column width
  lazy var columnWidth: CGFloat = {
    return bounds.width / CGFloat(days.count)
  }()

  override func draw(_ rect: CGRect) {
    
  }
  
  func drawGradient(context: CGContext) {
  }
  
  func drawText(context: CGContext) {
  }
  
}


