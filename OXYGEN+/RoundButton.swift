//
//  RoundButton.swift
//  OXYGEN+
//
//  Created by CPE450 Guest on 11/9/20.
//

import Foundation
import UIKit



@IBDesignable class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 30{
        didSet{
            refreshCorners(value: cornerRadius)
        }
    }
    
    override init(frame: CGRect){
        super.init(frame:frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    func sharedInit(){
        refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners(value: CGFloat){
        layer.cornerRadius = value
    }
    
    
    
   
  /*  @IBAction func buttonpress(_ sender: AnyObject){
        if let button : UIButton = sender as? UIButton{
            //button.isSelected = !button.isSelected
            
            if(button.isSelected){
                button.backgroundColor = UIColor.green
            }
            else{
                button.backgroundColor = UIColor.red
            }
        }
    }*/
    let color = UIColor(red: 128/255, green: 255/255, blue: 225/255, alpha: 0.8)
    
    override  var isHighlighted: Bool{
        didSet{
            backgroundColor = isHighlighted ?  UIColor.lightGray : color
        }
    }

    
   /* @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        button1.backgroundColor = UIColor.systemGreen
    }
    
    @IBAction func buttonTapped(sender: AnyObject){
        if button1.backgroundColor == UIColor.systemGreen{
            button1.backgroundColor = UIColor.gray
        }
        else if button1.backgroundColor == UIColor.gray{
            button1.backgroundColor = UIColor.systemGreen
        }
    }
    */
   /* @IBAction func buttonOneAction(sender: AnyObject){
        button1.isSelected = true;
        button1.backgroundColor = UIColor.gray
        button2.isSelected = false;
    }
    @IBAction func buttonTwoAction(sender: AnyObject){
        button1.isSelected = false;
        button2.isSelected = true;
    }*/
}


