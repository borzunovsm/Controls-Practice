//
//  ViewController.swift
//  Controls Practice
//
//  Created by Serega on 04.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet var switches: [UISwitch]!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    var number: UInt8 = 128{
        didSet{
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    /// updates all outlets to number
    func updateUI(){
        button.setTitle("\(number)", for: [])
        
        
        /// TODO: set switches to number
        
        
        slider.value = Float.init(number)
        
        textField.text = "\(number)"
    }

    
    
    @IBAction func buttonPressed() {
        number = UInt8((Int(number) + 1) % 256)
        //number += 1
       // print(#line, #function)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        print(#line, #function, sender.tag)
    }
    
    @IBAction func sliderMoved() {
        number = UInt8(slider.value)
        //print(#line, #function)
    }
    
    @IBAction func textFieldEdited() {
        number = UInt8(textField.text ?? "") ?? 128
        //print(#line, #function)
    }
    
}

