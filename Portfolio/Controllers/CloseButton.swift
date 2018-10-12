

import UIKit

class CloseButton: UIButton {
  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = bounds.width * 0.5
    layer.backgroundColor = UIColor.red.cgColor
    layer.borderColor = UIColor.white.cgColor
    layer.borderWidth = 2
    
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize.zero
    layer.shadowOpacity = 1
    layer.shadowRadius = 1
  }
}






















