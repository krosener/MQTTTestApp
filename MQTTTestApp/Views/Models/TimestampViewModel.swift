//
//  TimestampModel.swift
//  MQTTTestApp
//
//  Created by Kenneth Rosener on 1/29/23.
//

import Foundation
import CocoaMQTT

class TimestampViewModel : ObservableObject {
    @Published var stamp = Date()
    
    let topic = "/timestamp"
    var mqtt: CocoaMQTT5
    
    init() {
        mqtt = CocoaMQTT5(clientID:"CocoaMQTT5-" + String(ProcessInfo().processIdentifier), host: "localhost")
    /*
         mqtt.logLevel = .debug
        let connectProperties = MqttConnectProperties()
        connectProperties.topicAliasMaximum = 0
        connectProperties.sessionExpiryInterval = 0
        connectProperties.receiveMaximum = 100
        connectProperties.maximumPacketSize = 500

        mqtt.connectProperties = connectProperties
        mqtt.username = ""
        mqtt.password = ""

        let lastWillMessage = CocoaMQTT5Message(topic: "/will", string: "dieout")
        lastWillMessage.contentType = "JSON"
        lastWillMessage.willResponseTopic = "/will"
        lastWillMessage.willExpiryInterval = .max
        lastWillMessage.willDelayInterval = 0
        lastWillMessage.qos = .qos1

        mqtt.willMessage = lastWillMessage
        mqtt.keepAlive = 60
    */
        mqtt.delegate = self
    }
    
    deinit {
        mqtt.disconnect()
    }
    
    func connect() {
        mqtt.connect()
    }
    
    func subscribe() {
        mqtt.subscribe(topic)
    }
    
    func sendTimestamp() {
        let message = String(Date().timeIntervalSince1970)
        let publishproperties = MqttPublishProperties()
        publishproperties.contentType = "JSON"
        
        mqtt.publish(topic, withString: message, qos: .qos1, DUP: false, retained: false, properties: publishproperties)
    }
    
    func updateTimestamp(_ stamp:TimeInterval) {
        DispatchQueue.main.async {
            self.stamp = Date(timeIntervalSince1970: stamp)
        }
    }
}

extension TimestampViewModel : CocoaMQTT5Delegate {
    func mqtt5(_ mqtt5: CocoaMQTT5, didConnectAck ack: CocoaMQTTCONNACKReasonCode, connAckData: MqttDecodeConnAck?) {
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didPublishMessage message: CocoaMQTT5Message, id: UInt16) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didPublishAck id: UInt16, pubAckData: MqttDecodePubAck?) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didPublishRec id: UInt16, pubRecData: MqttDecodePubRec?) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveMessage message: CocoaMQTT5Message, id: UInt16, publishData: MqttDecodePublish?) {
        updateTimestamp(TimeInterval(message.string!)!)
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didSubscribeTopics success: NSDictionary, failed: [String], subAckData: MqttDecodeSubAck?) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didUnsubscribeTopics topics: [String], UnsubAckData: MqttDecodeUnsubAck?) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveDisconnectReasonCode reasonCode: CocoaMQTTDISCONNECTReasonCode) {
        
    }
    
    func mqtt5(_ mqtt5: CocoaMQTT5, didReceiveAuthReasonCode reasonCode: CocoaMQTTAUTHReasonCode) {
        
    }
    
    func mqtt5DidPing(_ mqtt5: CocoaMQTT5) {
        
    }
    
    func mqtt5DidReceivePong(_ mqtt5: CocoaMQTT5) {
        
    }
    
    func mqtt5DidDisconnect(_ mqtt5: CocoaMQTT5, withError err: Error?) {
        
    }
    
    
    
}
