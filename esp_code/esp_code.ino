const int DIR = 12;
const int STEP = 14;
const int  steps_per_rev = 200;

char inByte = '0';

#define led 34
#define relay 27

int tiltPin = 13;
int tiltValue = 0;

void setup() {

  Serial.begin(9600);  

  pinMode(STEP, OUTPUT);
  pinMode(DIR, OUTPUT);

  pinMode(led, OUTPUT);
  pinMode(relay, OUTPUT);

  pinMode(tiltPin, INPUT);

  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  
  establishContact();
}

int speeds[5] = {5000, 4000, 3000, 2000, 1000};
bool isStepperRotate  = false;
int stepperSpeed = speeds[0];
int isAlert = false;

void loop() {
  if (Serial.available() > 0){
    inByte = Serial.read();
    if(inByte == 't'){sent_data();}
    if(inByte == 'r'){isStepperRotate = true;}
    if(inByte == 's'){isStepperRotate = false;}
    if(inByte == '1'){stepperSpeed = speeds[0];}
    if(inByte == '2'){stepperSpeed = speeds[1];}
    if(inByte == '3'){stepperSpeed = speeds[2];}
    if(inByte == '4'){stepperSpeed = speeds[3];}
    if(inByte == '4'){stepperSpeed = speeds[4];}
    if(inByte == 'a'){isAlert = true;}
    if(inByte == 'o'){isAlert = false;}
  }
  // delay(10);
  runStepper();
  alertPy();
 }


void sent_data(){
  tiltValue = analogRead(tiltPin);
  // for(int i = 0; i< num_received_data; i++)
  //   {
      
      Serial.print(tiltValue);
      // Serial.print('-');
      // }
    Serial.println();
  }

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("A");   // send an initial string
    delay(300);
  }
  Serial.flush();
}

void runStepper(){
  if(isStepperRotate){
    digitalWrite(STEP, HIGH);
    delayMicroseconds(200);
    digitalWrite(STEP, LOW);
    delayMicroseconds(200);
  }
}

void alertPy(){
  if(isAlert){
    digitalWrite(led, HIGH);
    digitalWrite(relay, HIGH);
  } else {
    digitalWrite(led, LOW);
    digitalWrite(relay, LOW);
  }
}
