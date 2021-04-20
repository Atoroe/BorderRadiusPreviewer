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

