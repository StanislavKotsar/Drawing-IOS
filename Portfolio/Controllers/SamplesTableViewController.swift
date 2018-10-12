

import UIKit

class SamplesTableViewController: UITableViewController {
  
  private let sampleNames = ["Thermometer", "Budget", "Clock", "Login", "Rating", "Graph"]
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let preview = UIStoryboard(name: "Preview", bundle: nil)
    let sample = sampleNames[indexPath.row]
    let controller = preview.instantiateViewController(withIdentifier: sample)
    formatCloseButton(in: controller)
    present(controller, animated: true, completion: nil)
  }
  
  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return sampleNames.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell")
      as? SamplesTableViewCell else { fatalError() }
    
    if let sampleImage = UIImage(named: sampleNames[indexPath.row]) {
      cell.sampleImage = sampleImage
    }
    return cell
  }
  
  func formatCloseButton(in controller: UIViewController) {
    let closeButton = CloseButton(type: .custom)
    closeButton.addTarget(self, action: #selector(closeController), for: .touchUpInside)
    controller.view.addSubview(closeButton)
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    let safeArea = controller.view.safeAreaLayoutGuide
    let top = closeButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10)
    let trailing = closeButton.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -10)
    let width = closeButton.widthAnchor.constraint(equalToConstant: 40)
    let height = closeButton.heightAnchor.constraint(equalToConstant: 40)
    NSLayoutConstraint.activate([top, trailing, width, height])
  }
  
  @objc func closeController() {
    dismiss(animated: true, completion: nil)
  }
  
}

