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
    
    var number = 128{
        didSet{
            if number < 0 {
                number = 255
            }
            else if 255 < number {
                number = 0
            }
            //number = (number + 256) % 256
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotateSwitches()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func rotateSwitches(){
        for `switch` in switches{
            `switch`.layer.transform = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
            
        }
    }
    
    /// Updates number from the switches
    func updateNumberFromSwitches(){
      var number = 0
        for `switch` in switches{
            number += `switch`.isOn ? `switch`.tag : 0
        }
        self.number = number
    }
    
    /// Updates switches from number
    func updateSwitches(){
        for `switch` in switches{
            `switch`.isOn =  Int(number) & `switch`.tag != 0
        }
    }
    
    /// updates all outlets to number
    func updateUI(){
        button.setTitle("\(number)", for: [])
        updateSwitches()
        slider.value = Float.init(number)
        textField.text = "\(number)"
    }

    @IBAction func buttonPressed() {
        //number = UInt8((Int(number) + 1) % 256)
        number += 1
       // print(#line, #function)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
       // print(#line, #function, sender.tag)
        updateNumberFromSwitches()
    
    }
    
    @IBAction func sliderMoved() {
        number = Int(slider.value)
        //print(#line, #function)
    }
    
    @IBAction func textFieldEdited() {
        number = Int(textField.text ?? "") ?? 128
        //print(#line, #function)
    }
    
    @IBAction func ScreenTapped(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if location.x < view.bounds.midX{
            number -= 1
        }
        else{
            number += 1
        }
        //print(#line, #function, sender.location(in: view))
    }
    
}
