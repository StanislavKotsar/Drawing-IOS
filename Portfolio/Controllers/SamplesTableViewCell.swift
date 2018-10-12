

import UIKit

class SamplesTableViewCell: UITableViewCell {
  @IBOutlet weak var sampleImageView: UIImageView!
  
  let imageLayer = CALayer()
  var sampleImage: UIImage?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    sampleImageView.layer.addSublayer(imageLayer)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let layer = sampleImageView.layer
    layer.cornerRadius = 30
    layer.shadowOffset = CGSize(width: 4, height: 4)
    layer.shadowOpacity = 0.3
    layer.shadowRadius = 5.0
    
    imageLayer.frame = layer.bounds
    imageLayer.contents = sampleImage?.cgImage
    imageLayer.masksToBounds = true
    imageLayer.cornerRadius = layer.cornerRadius
    imageLayer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
  }
}



















































