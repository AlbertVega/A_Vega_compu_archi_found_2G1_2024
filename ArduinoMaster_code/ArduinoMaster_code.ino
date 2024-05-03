#include <SPI.h>

//-- Pin usado para la seleccion del esclavo
#define SS 10

void setup() 
{
  //-- Inicializar SPI
  SPI.begin();
  SPI.beginTransaction (SPISettings (2000000, MSBFIRST, SPI_MODE0));

  Serial.begin(9600);
}

//-- Realizar una transaccion. Se envia un dato
//-- y se devuelve lo recibido
uint8_t spi_transaction(uint8_t tx_value)
{
  //-- Activar el esclavo
  digitalWrite(SS, LOW);

  uint8_t rx_value = SPI.transfer(tx_value); 

  //-- Desactivar el esclavo
  digitalWrite(SS, HIGH);

  return rx_value;
}

void loop() 
{

  //-- Enviar el valor 0xAA
  uint8_t rx1 = spi_transaction(0xAA);
  Serial.print("Send: 0xAA. Received: ");
  Serial.println(rx1, HEX);
  delay(500);

}