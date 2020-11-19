import RPi.GPIO as GPIO
GPIO.setmode(GPIO.BCM) #set numbering scheme
GPIO.setup(4,GPIO.OUT) #set GPIO4 as output.
GPIO.setoutput(4,1) #set value of GPIO4 to True or 1
mqtt.publish("pi/GPIO/4",GPIO.input(4))