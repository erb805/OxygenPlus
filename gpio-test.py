#!/usr/bin/env python
# -*- coding: utf-8 -*-

import paho.mqtt.client as mqtt
import paho.mqtt.publish as publish
import time
import sys
import os
import RPi.GPIO as gpio
	

def gpioSetup():
	#Set pin numbering to Broadcom scheme
	gpio.setmode(gpio.BCM)

	#Set GPIO26 as an output pin
	gpio.setup(26, gpio.OUT)
	gpio.output(26, gpio.LOW)

def blinkLED(blinks, pin):
	for i in range(blinks):
		gpio.output(pin, gpio.HIGH)
		time.sleep(0.5)
		gpio.output(pin, gpio.LOW)
		time.sleep(0.5)

def connectionStatus(client, userdata, flags, rc):
	mqttClient.subscribe("rpi/gpio")

#this is where logic happens
def messageDecoder(client, userdata, msg):
	message = msg.payload.decode(encoding='UTF-8')

	if message == "Normal":
		blinkLED(1,26)
		print(message)
		if len(sys.argv) > 1:
			os.write(sys.argv[1], message)
		else:
			print("no file descriptor given")

	elif message == "Warning":
		blinkLED(2,26)
		print(message)
		if len(sys.argv) > 1:
			os.write(sys.argv[1], message)
		else:
			print("no file descriptor given")

	elif message == "Danger":
		blinkLED(3,26)
		print(message)
		if len(sys.argv) > 1:
			os.write(sys.argv[1], message)
		else:
			print("no file descriptor given")
	
	else:
		print("unknown message")

#Set client name
clientName = "oxygenplus"

#Set MQTT server address
serverAddress = "66.215.49.37"

#Instantiate Eclipse Paho as mattClient
mqttClient = mqtt.Client(clientName)

mqttClient.on_connect = connectionStatus

mqttClient.on_message = messageDecoder



#Setup RPI GPIO pins
gpioSetup()

mqttClient.connect(serverAddress)

count = 0
#main program loop
while (1):
	#client loop (blocks for 100ms)
	#I have found that any lower delay leads to lag when recieveing signals
	mqttClient.loop(0.1)
	#Use this to publish messages from RPI
	mqttClient.publish("ios/gpio", "test "+str(count))
	count += 1








