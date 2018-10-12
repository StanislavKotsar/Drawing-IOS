

import UIKit

@IBDesignable
class LoginView: UIView {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }
  
  func setup() {
    setupControls()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }

  // M Subviews
  
  final class TextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
      return makeInsetRect(bounds: bounds)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
      return makeInsetRect(bounds: bounds)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return makeInsetRect(bounds: bounds)
    }
    
    private func makeInsetRect(bounds: CGRect) -> CGRect {
      return bounds.insetBy(dx: 20, dy: 0)
    }
    
  }
  
  let name = TextField()
  let password = TextField()
  let button = UIButton()
  
  func setupControls() {
    addSubview(name)
    addSubview(password)
    addSubview(button)
    name.backgroundColor = .white
    name.placeholder = "name"
    password.backgroundColor = .white
    password.placeholder = "password"
    password.isSecureTextEntry = true
    button.setTitle("Login", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    name.translatesAutoresizingMaskIntoConstraints = false
    var centerX = name.centerXAnchor.constraint(equalTo: centerXAnchor)
    var top = name.topAnchor.constraintEqualToSystemSpacingBelow(topAnchor, multiplier: 7)
    var width = name.widthAnchor.constraint(equalToConstant: bounds.width/1.4)
    var height = name.heightAnchor.constraint(equalToConstant: 50)
    
    NSLayoutConstraint.activate([centerX, top, width, height])
    
    password.translatesAutoresizingMaskIntoConstraints = false
    centerX = password.centerXAnchor.constraint(equalTo: centerXAnchor)
    top = password.topAnchor.constraintEqualToSystemSpacingBelow(name.topAnchor, multiplier: 8)
    width = password.widthAnchor.constraint(equalToConstant: bounds.width / 1.4)
    height = password.heightAnchor.constraint(equalToConstant: 50)
    
    NSLayoutConstraint.activate([centerX, top, width, height])
    
    button.translatesAutoresizingMaskIntoConstraints = false
    centerX = button.centerXAnchor.constraint(equalTo: centerXAnchor)
    top = button.topAnchor.constraintEqualToSystemSpacingBelow(password.topAnchor, multiplier: 10)
    width = button.widthAnchor.constraint(equalToConstant: bounds.width / 3)
    height = button.heightAnchor.constraint(equalToConstant: 44)
    
    NSLayoutConstraint.activate([centerX, top, width, height])
    
  }
}
