//
//  ViewController.swift
//  BorderRadiusPreviewer
//
//  Created by Artiom Poluyanovich on 20.04.21.
//

import UIKit

class BorderRadiusViewController: UIViewController {

    @IBOutlet weak var shapeView: UIView!
    @IBOutlet var radiusTextFields: [UITextField]!
    
    
    let startColor = UIColor(red: 255/255,
                             green: 224/255,
                             blue: 68/255,
                             alpha: 1)
    let endColor = UIColor(red: 247/255,
                           green: 116/255,
                           blue: 116/255,
                           alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        shapeView.addGradient(startPointColor: startColor, endPointColor: endColor)
        shapeView.roundCorners()
    }
}

//MARK: - TextField and keyBoard extension
extension BorderRadiusViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            shapeView.roundCorners(corners: .topLeft, radius: 30)
        case 1:
            shapeView.roundCorners(corners: .topRight, radius: 30)
        case 2:
            shapeView.roundCorners(corners: .bottomRight, radius: 30)
        default:
            shapeView.roundCorners(corners: .bottomLeft, radius: 30)
        }
        
        resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            shapeView.roundCorners(corners: .topLeft, radius: 30)
        case 1:
            shapeView.roundCorners(corners: .topRight, radius: 30)
        case 2:
            shapeView.roundCorners(corners: .bottomRight, radius: 30)
        default:
            shapeView.roundCorners(corners: .bottomLeft, radius: 30)
        }
        view.endEditing(true)
        return true
    }
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChange(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChange(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc private func keyboardWillChange(_ notification: NSNotification) {
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        if notification.name == UIResponder.keyboardWillShowNotification {
            self.signUpBottomConstraint.constant = keyboardFrame.height
            self.view.layoutIfNeeded()
            self.blurryWillChange(statment: true)
        } else {
            self.signUpBottomConstraint.constant = self.initialConstraintHeight
            self.view.layoutIfNeeded()
            self.blurryWillChange(statment: false)
            
        }
    }
}

