

import UIKit

@IBDesignable
class ClockView: UIView {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }

  private func setup() {
  }
  

  // method for drawing the numbers in section 2
  func draw(number: Int) {
    let string = "\(number)" as NSString
    let attributes = [NSAttributedStringKey.font: UIFont(name: "Avenir-Heavy", size: 18)!]
    let size = string.size(withAttributes: attributes)
    string.draw(at: CGPoint(x: bounds.width/2 - size.width/2, y: 10), withAttributes: attributes)
  }

  
}

