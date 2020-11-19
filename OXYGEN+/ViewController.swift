//
//  ViewController.swift
//  OXYGEN+
//
//  Created by CPE450 Guest on 10/7/20.
//

import UIKit
import CocoaMQTT

extension ViewController: CocoaMQTTDelegate{
    
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        mqttClient.subscribe("ios/gpio")
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        if let msgString = message.string {
            //set the label to the message
            mqttLabel.text = msgString
            
        }
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topics: [String]) {
        
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        
    }
    
    func mqttDidPing(_ mqtt: CocoaMQTT) {
        
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        
    }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        
    }
}

class ViewController: UIViewController{
    
    //Instantiate CocoaMQTT as MQTT client
//    let mqttClient = CocoaMQTT(clientID: "iOS Device", host: "66.215.49.37", port: 1883)
    
    var mqttClient: CocoaMQTT!
    
    func setUpMQTT()
    {
        mqttClient = CocoaMQTT(clientID: "iOS Device", host: "66.215.49.37", port: 1883)
        mqttClient.username = "phone"
        mqttClient.password = "password"
        mqttClient.willMessage = CocoaMQTTWill(topic: "/will", message: "dieout")
        mqttClient.keepAlive = 60
        mqttClient.connect()
        mqttClient.delegate = self
    }

    
    var isConnected = false
    
    @IBOutlet var mqttLabel: UILabel!
    
    @IBAction func Danger(_ sender: RoundButton) {
        mqttClient.publish("rpi/gpio",withString: "Danger")    }
    
    @IBAction func Warning(_ sender: RoundButton) {
        mqttClient.publish("rpi/gpio",withString: "Warning")    }
    
    @IBAction func Normal(_ sender: RoundButton) {
        mqttClient.publish("rpi/gpio",withString: "Normal")    }
    
    //Connect to RPI once if switch is on, disconnect if switch is turned off
    @IBAction func Connect(_ sender: UISwitch) {
        if sender.isOn && isConnected == false
        {
            setUpMQTT()
            isConnected = true
        }
        else if isConnected == true && sender.isOn == false
        {
            mqttClient.disconnect()
            isConnected = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
   
    
   
    
   
   


}

