#include <Wire.h>
#include "AS5600.h"  // Librería para el encoder digital

// Pines del puente H
#define IN1 12
#define IN2 13
#define PWM1 11
#define IN3 8
#define IN4 9
#define PWM2 10

AS5600 encoderDigital;  // Instancia para el encoder digital
int sensorAnalogicoPin = A0;  // Pin analógico del encoder

double angleDigital, angleAnalog;
double offsetDigital = 0;  // Offset para inicializar el ángulo en 0
double offsetAnalog = 0;   // Offset para inicializar el ángulo en 0
long previousMillis = 0;

// Configurar la dirección y PWM del motor
void configMotor(int motor, int direction, float PWM) {
  if (motor == 1) {
    digitalWrite(IN1, !direction);
    digitalWrite(IN2, direction);
    analogWrite(PWM1, PWM);
  } else {
    digitalWrite(IN3, !direction);
    digitalWrite(IN4, direction);
    analogWrite(PWM2, PWM);
  }
}

void setup() {
  Serial.begin(9600);
  Wire.begin();  // Iniciar comunicación I2C para el encoder digital
  
  // Configuración del puente H
  pinMode(PWM1, OUTPUT);
  pinMode(PWM2, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);

  Serial.println("Iniciando el sistema...");
  
  // Inicializar los ángulos para que comiencen en 0
  offsetDigital = map(encoderDigital.getCumulativePosition(), 0, 4095, 0, 360);
  offsetAnalog = map(analogRead(sensorAnalogicoPin), 0, 1023, 0, 360);
  
  delay(1000);  // Pausa de 1 segundo para estabilizar las lecturas
}

void loop() {
  unsigned long currentMillis = millis();
  
  // Control básico de motores (detener)
  configMotor(2, 1, 0);  
  configMotor(1, 0, 170);

  // Leer los encoders cada 5 ms
  if (currentMillis - previousMillis >= 5) {
    previousMillis = currentMillis;
    
    // Leer el ángulo del encoder digital (AS5600 en I2C)
    angleDigital = map(encoderDigital.getCumulativePosition(), 0, 4095, 0, 360) - offsetDigital;  // Ajuste de offset
    if (angleDigital < 0) {
      angleDigital += 360;  // Mantener el ángulo entre 0 y 360
    }

    // Leer el ángulo del encoder analógico (AS5600 en el pin A0)
    angleAnalog = map(analogRead(sensorAnalogicoPin), 0, 1023, 0, 360) - offsetAnalog;  // Ajuste de offset
    if (angleAnalog < 0) {
      angleAnalog += 360;  // Mantener el ángulo entre 0 y 360
    }

    // Imprimir las lecturas de los ángulos
    Serial.print("Ángulo digital: ");
    Serial.print(angleDigital);
    Serial.print("°, Ángulo analógico: ");
    Serial.print(angleAnalog);
    Serial.println("°");
  }
}
