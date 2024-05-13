#include <SPI.h>

// Pin usado para la seleccion del esclavo
#define SS 10
bool handshakeDone;
bool done;
const byte handshakeMessage = 0b11111111;
byte sentMessage;


void setup() 
{
  pinMode(SS, OUTPUT);
  digitalWrite(SS, HIGH);
  SPI.begin();
  SPI.beginTransaction(SPISettings (2000000, MSBFIRST, SPI_MODE0));
  handshakeDone = false;
  done = false;
  Serial.begin(9600);
}


byte transferData(const byte dato)
{
  byte recibido = SPI.transfer(dato);
  delayMicroseconds(20);
  return recibido;
}

void loop() 
{
  if (!done){
    if (!handshakeDone) {

      digitalWrite(SS, LOW); //enable slave select
      byte response = transferData(handshakeMessage); //send handshake
      delay(500);
      digitalWrite(SS, HIGH); //disable slave select
      

      Serial.println("Mensaje enviado: ");
      Serial.println(handshakeMessage);
      Serial.print("Respuesta: ");
      Serial.println(response);
      // Check if the response is the expected handshake message:
      if (response == handshakeMessage) {
        // Handshake successful
        Serial.println("Handshake exitoso!");
        handshakeDone = true;
      } 
    } else {
      digitalWrite(SS, LOW); //enable slave select
      sentMessage = SPI.transfer(0b00010111); 
      //                           ^^^^^^^^
      //                          15
      Serial.println(sentMessage);
      sentMessage= SPI.transfer(0b00000000); 
      //                          ^^^^^^^^
      //                          76543210
      Serial.println(sentMessage);
      digitalWrite(SS, HIGH); //disable slave select
      done = true;
    }
  }
}