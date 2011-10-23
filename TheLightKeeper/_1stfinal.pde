// Based on File > Examples > Servo > Knob
// Controlling a servo position using a potentiometer (variable resistor) 
// by Michal Rinott <http://people.interaction-ivrea.it/m.rinott> 

#include <Servo.h>
#include <Firmata.h>

Servo myservoh;  // create servo object to control a servo 
Servo myservov;
int potpin0 = 0;  // analog pin used to connect the potentiometer
int potpin1 = 1;
int potpin2 = 2;
int potpin3 = 3;
int val0;    // variable to read the value from the analog pin 
int val1;
int val01;
int val2;
int val3;
int pos0;
int pos1;
int posavgh;
int posavgv;
boolean stopServo = false;

void setup() 
{ 
  //Serial.begin(9600);
  myservoh.attach(8);  // attaches the servo on pin 9 to the servo object 
  myservov.attach(9);
  Firmata.setFirmwareVersion(0, 1);
  Firmata.begin(57600);
} 

void loop() 

{ 
  
  
  val0 = analogRead(potpin0);            // reads the value of the potentiometer (value between 0 and 1023)
  val1 = analogRead(potpin1);
  val2 = analogRead(potpin2);
  val3 = analogRead(potpin3);
  pos0 = 180;
  pos1 = 1;
  posavgh = (val0 + val1)/2;
  posavgv = (val2 + val3)/2;
  int sensorValue = analogRead(0);
  int sensorValue1 = analogRead(1);
  int sensorValue2 = analogRead(2);
  int sensorValue3 = analogRead(3);
  
  Firmata.sendAnalog(0, sensorValue);
 Firmata.sendAnalog(1, sensorValue1);
Firmata.sendAnalog(2, sensorValue2);
Firmata.sendAnalog(3, sensorValue3);
   
 // pos01 = 2;
    Serial.println(val0); 
    Serial.println(val1); 
    delay(1000);
 // va0 = map(val0, 50, 300, 0, 179);     // scale it to use it with the servo (value between 0 and 180) 
if(stopServo != true){
   if (val0 > val1)
  {
    // myservo.attach(8);
    myservoh.write(pos0);                  // sets the servo position according to the scaled value 
    delay(50);                           // waits for the servo to get there
  }
  else if (val0 < val1)
 { 
   // myservo.attach(8);
   myservoh.write(pos1);
   delay(50);
 } 

 else if (val2 < val3)
 { 
   // myservo.attach(8);
   myservov.write(pos1);
   delay(50);
 } 
 else if (val2 > val3)
 { 
   // myservo.attach(8);
   myservov.write(pos0);
   delay(50);
 }
else if(val1 - val0 < 10) {
  stopServo = true;
} 
}

 
 // else if (val0 == val1)
 // {
 //  myservo.read();

  //delay(500);
  
//  }




 
} 


  //val = analogRead(potpin2);
  //val = analogRead(potpin3); 
  
    //Serial.println(val);  
  //val = map(val, 50, 300, 0, 179);     // scale it to use it with the servo (value between 0 and 180) 
  //myservoa.write(val);                  // sets the servo position according to the scaled value 
  //delay(50);                           // waits for the servo to get there
  



