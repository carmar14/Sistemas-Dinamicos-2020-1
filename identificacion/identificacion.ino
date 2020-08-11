// Un cero y tres polos
//Se definen las variables que se usarán en el programa
// Contador de muestras
float Samples = 0;
// Salida de la planta Y(K)
float Y_K=0;
float Y_K1 = 0;
float Y_K2 = 0;
float Y_K3 = 0;

// Entrada de la planta U(K)
float U_K1 = 0;
float U_K2 = 0;
float U_K3 = 0;
float randNumber;



void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
//Ciclo principal donde se calcular la actualización del estado del sistema usando las ecuaciones de estado

  // Contador de muestras para saber cuando se va a cambiar la entrada al sistema
  Samples = Samples + 1;

  // Si el contador de muestras es 1 (uno) se modifica la entrada al sistema generando un número randómico
  if (Samples == 1)
  {
    //Se genera un número randómico entre 0 y 50
    randNumber = random(-3,3);
    Samples = Samples + 1;
  }

  // Si el contador de muestras supera un valor se resetea el contador para que se vuelva a generar una nueva entrada
  if (Samples > 30)
  {
    Samples = 0;
  }

  //Se manda vía serial la salida del sistema y la entrada
//Serial.print("E ");
Serial.print(U_K1);
Serial.print(',');
Serial.print(Y_K);
Serial.print('\n');

  Y_K=5.033*U_K1+3.905*U_K2+2.323*pow(10,-5)*U_K3+0.8793*Y_K1-0.4752*Y_K2-5.645*pow(10,-18)*Y_K3;
  
//Se actualizan el valor de los estados para la siguiente iteración
Y_K3=Y_K2;
Y_K2=Y_K1;
Y_K1=Y_K;
U_K3=U_K2;
U_K2=U_K1;
U_K1=randNumber;



//Retardo o tiempo en el que el ciclo se vuelve a repetir
delay(1000);
  
}
