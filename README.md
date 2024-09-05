# Proyecto Académico para la materia de Servomecanismos
Integrates: Marcos Fierro Sarria, Joyner Caballero Abril, Camilo Zamora Apraez

Profesor: Víctor Hugo Grisales Palacios.

Universidad Nacional de Colombia Sede Bogotá

Facultad de Ingeniería

2024

# PRODUCTO
Informe técnico de ingeniería, máximo 20 páginas más anexos

## - Introduccion:

Este proyecto tiene como objetivo desarrollar un dispositivo capaz de seguir de manera precisa una trayectoria en forma de trébol de cuatro hojas, integrando principios de ingeniería mecánica, automatización y control. El propósito central es diseñar un sistema que permita generar movimientos complejos y controlados, aplicando conocimientos avanzados en mecatrónica.

El dispositivo consta de dos brazos articulados, controlados por motores que posibilitan el trazado exacto de la trayectoria deseada. Para asegurar la precisión del movimiento, se ha implementado un controlador que no solo regula el comportamiento de los motores, sino que también permite ajustar en tiempo real tanto la escala como la orientación de la trayectoria. Esto ofrece una versatilidad única, facilitando la creación de tréboles de distintos tamaños y orientaciones.

El proyecto abarca varias fases clave. Primero, se realiza el diseño mecánico, estableciendo las configuraciones y restricciones del sistema. Posteriormente, se procede con la modelización y caracterización de los motores, fundamentales para garantizar un control preciso. Se ha implementado un análisis de cinemática inversa, que convierte las coordenadas de la trayectoria en los ángulos adecuados para los motores, asegurando un seguimiento exacto del patrón.

Una vez desarrollada la cinemática, se diseñó un controlador que ha sido validado a través de simulaciones exhaustivas antes de ser implementado en la plataforma física. La construcción física del sistema incluye la fabricación de las piezas mecánicas, el ensamblaje de los componentes, y la programación del controlador en una plataforma basada en Arduino.

El dispositivo también cuenta con la capacidad de visualizar en tiempo real tanto la trayectoria deseada como la trayectoria real seguida por el sistema, lo que permite un monitoreo constante y ajustes precisos durante su operación.

## - Análisis y Diseño de Ingeniería:
- Objetivos y alcance: El siguiente proyecto tiene como finalidad el desarrollo integral de un manipulador planar de dos grados de libertad que dibuje tréboles de n hojas a través del control automático. El trabajo abarca desde la conceptualización del brazo hasta el el diseño y contrucción del mismo y se espera que la puesta en escena del proyecto facilite el aprendizaje del trabajo colaborativo y el desarrollo de habilidades prácticas de cada integrante.
- Marco Teórico: Cinemática de robots y su aplicación en el brazo,Planificación de trayectorias,Control
La trayectoria se definió en dos partes. Una que lleva al mecanismo desde la posición de recogido hasta la posición en la que empieza a dibujar el trébol. Este a su vez se modeló como una función polar parametrizada, esto se hace para cambiar la cantidad de hojas, la profundidad de las mismas, su factor de rotación y su factor de escala.
- Diseño conceptual: 
Dado el requerimiento de un mecanismo planar con dos grados de libertad, se propuso un manipulador serial de dos eslabones como solución inicial. Esta configuración requiere, a su vez, de dos actuadores independientes para controlar la posición de cada articulación.
- Diseño detallado: Una vez finalizado el diseño conceptual, se procedió a modelar las piezas individuales del mecanismo en Autodesk Inventor. Los modelos tridimensionales resultantes, en formato STL, se encuentran almacenados en la carpeta "Modelos". Dada la complejidad geométrica de algunas piezas y la necesidad de obtener prototipos rápidamente, se optó por usar impresión 3D. El material seleccionado para la impresión fue PLA, ya que es una opción adecuada para prototipado y aplicaciones donde no se requieren propiedades mecánicas extremas. En la siguiente imagen se presenta una vista del ensamble de la parte mecánica del mecanismo.

![image](https://github.com/user-attachments/assets/c2a191e6-cfbc-49ae-b5e4-586aeb06a1e6)

## - Restricciones de Diseño
Configuración Mecánica:
El sistema está compuesto por una base fija y dos eslabones móviles que operan en un plano vertical. Para asegurar el control preciso del movimiento, el mecanismo cuenta con dos articulaciones motorizadas de tipo rotacional, las cuales permiten que los eslabones sigan la trayectoria programada. Esto asegura que el sistema sea capaz de realizar los movimientos deseados dentro de los parámetros definidos.

Trayectoria del Trébol:
El dispositivo está diseñado para seguir una trayectoria específica que se mide desde el extremo distal del segundo eslabón. Esta trayectoria tiene la forma de un trébol de cinco hojas con un contorno estilizado, adaptado al diseño y simulación. Además, la trayectoria debe estar completamente inscrita dentro de un cuadrado de 150 mm de lado, garantizando la precisión y el ajuste adecuado del mecanismo en el espacio de trabajo.

Control de Escala y Rotación:
El sistema debe permitir que la escala de la trayectoria se ajuste en tiempo real, ofreciendo flexibilidad en la operación. Además, el dispositivo tiene la capacidad de rotar la trayectoria en tiempo real, con un rango de ±45 grados, lo que permite una mayor versatilidad en las configuraciones y adaptaciones del mecanismo a diferentes requerimientos.

Posición de Inicio (Home):
Al comenzar el movimiento, el sistema debe estar posicionado en el punto inicial o "home", y su ubicación debe estar como máximo a la mitad de la altura del trébol estilizado, hacia la izquierda del cuadrado en el cual la figura está inscrita. Esto garantiza que el sistema esté correctamente preparado para iniciar su ciclo de movimiento de forma eficiente.

Velocidad del Movimiento:
El servomecanismo debe operar a una velocidad constante dentro de un rango ajustable de 1 a 10 cm/s. Este rango de velocidades permite una adaptación flexible, dependiendo de las necesidades del proyecto, asegurando al mismo tiempo un movimiento fluido y controlado a lo largo de la trayectoria definida.

Seguimiento Preciso:
Tras una fase de aproximación, el servomecanismo debe ser capaz de seguir los perfiles de movimiento preestablecidos con precisión. Este seguimiento debe realizarse repetidamente, permitiendo al sistema trazar la trayectoria del trébol estilizado por hasta 10 ciclos, con un enfoque en la rapidez y exactitud del proceso.

Gráficos en Tiempo Real:
El dispositivo debe proporcionar una visualización tanto de la trayectoria deseada como de la trayectoria real recorrida por el mecanismo. Esta información debe ser representada gráficamente en un ordenador en tiempo real, permitiendo el monitoreo continuo y la posibilidad de realizar ajustes en tiempo real para optimizar la operación y corregir cualquier desviación del perfil de movimiento esperado.

## - Cinematica inversa:

Para determinar los puntos cartesianos del trébol de cinco hojas que el sistema trazará, permitiendo rotación y escalado, se emplea la siguiente ecuación paramétrica:

![image](https://github.com/user-attachments/assets/08a47f66-dc49-49d1-b157-804f8ff464f3)

En esta ecuación, E representa el factor de escala, cuyo valor en este caso es 30, correspondiente a un trébol inscrito en un cuadrado de 30 mm de lado. El parámetro C define el número de pétalos de la figura, que será de cinco hojas. D controla la rotación de la figura, mientras que A y B  son parámetros que suavizan la forma del trébol.

Una vez parametrizada la figura, las coordenadas cartesianas "x" y "y" se calculan mediante las ecuaciones: 

![image](https://github.com/user-attachments/assets/6bc88f56-b252-45c7-a28c-29d6eba1d6c6)

Donde L1 y L2 representan los desplazamientos del origen de la figura en milímetros.

Para realizar el análisis cinemático de los eslabones del mecanismo, se emplea trigonometría para calcular los ángulos de cada articulación. Estos ángulos son fundamentales para controlar el movimiento del sistema. Utilizando la función atan2 se calculan los ángulos correspondientes a los eslabones del robot: 

![image](https://github.com/user-attachments/assets/b5e864ff-1b36-437c-8a3b-5451186e3a78)

Estas ecuaciones permiten calcular los ángulos, que corresponden a las posiciones de los eslabones del mecanismo respecto al eje 𝑋. Los ángulos son necesarios para que los motores sigan la trayectoria deseada del trébol de cinco hojas.

El proceso de cinemática inversa traduce las coordenadas cartesianas de la trayectoria en ángulos de las articulaciones, permitiendo al mecanismo trazar la forma con precisión. Esto garantiza que los eslabones del robot sigan la trayectoria establecida de manera fiel y precisa. El uso de estas ecuaciones también permite ajustar los parámetros del trébol y la rotación del mismo en tiempo real, lo que proporciona flexibilidad al sistema.

Finalmente, este análisis cinemático es implementado en una interfaz gráfica donde se visualizan tanto la trayectoria deseada como los perfiles de movimiento de los motores, incluyendo posición, velocidad y aceleración. Esto permite un monitoreo y control precisos del mecanismo robótico a medida que sigue la trayectoria programada.

![image](https://github.com/user-attachments/assets/021a607e-f823-4062-9c14-631172c0f685)

## - Perfiles: 

Para obtener los perfiles de movimiento, se ha definido un intervalo de tiempo durante el cual se ejecuta tanto el despliegue del brazo como el trazado de la figura estipulada. Se han establecido dos tiempos específicos para estas acciones: 5 minutos destinados a la rutina de dibujo y 30 segundos asignados al despliegue completo del brazo. Estos tiempos permiten un control preciso del movimiento y aseguran que las figuras se tracen de manera eficiente dentro de los parámetros definidos.

Además, se considera crucial incorporar el factor de transmisión en la posición, el cual se ha calculado en función de la relación entre los tamaños de los engranajes y poleas que forman parte del sistema de transmisión de cada motor. Este factor de transmisión es determinado por la relación entre la velocidad de entrada y salida de los motores:

![image](https://github.com/user-attachments/assets/1b759e70-f185-472a-9436-07fd8e572c1d)

Este factor se utiliza para sincronizar la posición de los motores con la de los eslabones, de manera que el giro de los motores se corresponda con las posiciones específicas requeridas para que los eslabones sigan la trayectoria deseada. Esto ha permitido trazar las curvas de posición de cada uno de los motores en función del tiempo. Las posiciones derivadas de estos cálculos se muestran en la figura correspondiente, lo que facilita la visualización del rendimiento del sistema durante su operación.

![image](https://github.com/user-attachments/assets/129ba500-f222-4231-8834-79426f02ad67)

Es fundamental señalar que el brazo comienza su trayectoria desde una posición completamente plegada, en la cual los ángulos de las articulaciones se encuentran en 𝜋 radianes. A partir de esta posición inicial, se ha establecido un perfil de posición a lo largo del tiempo. Para modelar con precisión el comportamiento de los motores, hemos realizado una aproximación mediante una ecuación polinómica de orden 17, la cual describe la evolución de las posiciones de los motores a lo largo del tiempo. Esta ecuación nos permite derivar las posiciones para obtener aproximaciones de la velocidad y aceleración en función del tiempo.

Las gráficas resultantes de velocidad y aceleración, generadas a partir de las aproximaciones mencionadas, se presentan en las siguientes imágenes, ofreciendo una visión clara del rendimiento dinámico del sistema. 

![image](https://github.com/user-attachments/assets/e69b265a-936f-47be-a3ae-707418ad26cb)

Velocidad de cada uno de los motores con respecto al tiempo

![image](https://github.com/user-attachments/assets/ae6c97c8-fddc-4e37-9df1-3ffe9367e9c7)

Aceleracion de cada uno de los motores con respecto al tiempo

Determinación de los torques 𝑇1 y 𝑇2 requeridos por el mecanismo:

Para la determinación de los torques 𝑇1 y 𝑇2 en cada articulación del mecanismo, se ha utilizado el enfoque Lagrangiano. Este enfoque define al Lagrangiano, representado por 𝐿, como la diferencia entre la energía cinética total 𝐾 y la energía potencial total 𝑈 del sistema, tal como se observa en la siguiente ecuacion:

![image](https://github.com/user-attachments/assets/6309af14-f282-4770-b0d4-a913914a5a56)

Para simplificar el análisis, hemos considerado el conjunto "eslabón 1 + motor 2" como una sola pieza, a la que denominamos 𝐿1, y el conjunto "eslabón 2 + marcador" como otra pieza, a la que llamamos 𝐿2. De esta forma, podemos definir las energías cinéticas traslacionales de 𝐿1 y 𝐿2 como 𝐾𝑇𝐿1 y 𝐾𝑇𝐿2, respectivamente. A su vez, las energías cinéticas rotacionales de ambos conjuntos se denotan como 𝐾𝑅𝐿1 y 𝐾𝑅𝐿2.

Para las energías potenciales, definimos 𝑈𝐿1 como la energía potencial del eslabón 1, y 𝑈𝐿2 como la correspondiente al eslabón 2. Estas energías están asociadas con el centro de masa de cada conjunto.

De este modo, el Lagrangiano para el sistema completo se expresa como:

![image](https://github.com/user-attachments/assets/3315f1ca-66f2-4da9-9348-f627b014a121)

Antes de proceder con la determinación de cada uno de estos términos, es importante definir algunos valores del diagrama presentado anteriormente.

Explicación del mecanismo y valores utilizados

En el diagrama de la figura, las longitudes de los eslabones 𝑙1 y 𝑙2 corresponden a los eslabones 1 y 2, respectivamente. El término 𝑚1 representa la masa conjunta del eslabón 1 y el motor 2, mientras que 𝑚2 es la masa combinada del eslabón 2 y el marcador. Los centros de masa de los conjuntos 𝐿1 y 𝐿2 se denotan como 𝑐𝑚1 y 𝑐𝑚2, respectivamente. Además, las distancias 𝑙𝑐1 y 𝑙𝑐2 son las distancias entre las articulaciones fijas y los centros de masa de cada eslabón.

La masa de los eslabones móviles fue calculada considerando geometrías aproximadas de los componentes, que incluyen un ancho de 4 cm y un espesor de 5 mm, con los valores de masa obtenidos a partir de densidades de los materiales utilizados. En particular, para los eslabones se utilizó MDF con una densidad de 450 kg/m³, asignando a los motores y marcadores masas respectivas de 300 g y 50 g.

Energía cinética y potencial

El término de la energía cinética rotacional de 𝐿2 se define como:

![image](https://github.com/user-attachments/assets/a85cdd81-d576-4ad1-a300-54af0fcb3837)

donde 𝐼𝐿2 es el momento de inercia de 𝐿2 y 𝜔2 es la velocidad angular del eslabón 2. Por otro lado, la energía potencial gravitacional se expresa mediante la siguiente fórmula general:

![image](https://github.com/user-attachments/assets/688eb5b7-3870-49e0-a594-922e9b798358)

donde 𝑚 es la masa del cuerpo, 𝑔 es la aceleración de la gravedad y ℎ es la altura del centro de masa respecto a un punto de referencia. Para nuestro mecanismo, tomamos como referencia el punto más bajo alcanzado por los centros de masa de los eslabones en la posición de reposo, es decir, cuando los ángulos 𝜃1 = 90∘ y 𝜃2 = 0∘. En esta configuración, el mecanismo se encuentra en una posición vertical, colgando bajo la acción de la gravedad.

La energía potencial gravitacional de cada eslabón, en su posición de equilibrio, está dada por:

![image](https://github.com/user-attachments/assets/dec12e49-ebd3-4c51-8e64-b9d7d598d108)

Con estos términos ya definidos, podemos reescribir el Lagrangiano completo del sistema como:

![image](https://github.com/user-attachments/assets/4cc9791a-7fe4-4389-9bf7-2df1076cb2d7)

Cálculo de los torques

De acuerdo con el enfoque Lagrangiano, los torques 𝑇1 y 𝑇2 requeridos en las dos articulaciones dependen de las derivadas parciales de la función Lagrangiana respecto al tiempo y las coordenadas angulares 
𝜃1 y 𝜃2. Estas derivadas se calculan mediante las ecuaciones de Euler-Lagrange:

Para las demás partes, se adquirieron los siguientes componentes:


INSERTAR COMPONENTES

Se presenta el diagrama de conexiones:

INSERTAR DIAGRAMA DE CONEXIONES

- Modelado matemático: Se hizo el modelado del sistema usando Matlab y Simulink, se tomó el modelo matemático del libro:  ,y se procedió a hacer un bloque con el sistema serial de dos eslabones. Las variables de masa, inercia y longitudes, fueron tomadas del entorno de Inventor.

![image](https://github.com/user-attachments/assets/4646bcfe-b904-42f7-a1b8-5c2aea04b4d1)

![image](https://github.com/user-attachments/assets/c3df568f-359b-45f7-8d45-7f6f64c4c473)

## - Implementación: 
- Interfaz gráfica: Al inicio del proyecto, se realizó una interfaz sencilla en Matlab que muestra la interacción entre los dos eslabones que conforman el mecanismo, y como se dibuja la forma del trébol. Esta interfaz, permite selccionar una longitud en centímetros para cada eslabón, además de seleccionar la cantidad de hojas que queremos en el trébol y el tamaño del mismo. La interfaz servía de ayuda para ver la ubicación de la trayectoria y el brazo, lo que permitió hacer ajustes por ejemplo, en el punto del que se dibuja el trébol. El código fuente puede encontrarse en la carpeta "Códigos".
![image](https://github.com/user-attachments/assets/52317996-c40e-4d17-b3f2-a4d500d8be67)

- Construcción: Proceso de montaje
- Pruebas experimentales: Procedimiento de las pruebas, comparación entre simulaciones y la realidad, análisis de errores
  
## - Funcionamiento:
- Funcionamiento del brazo, identificar fortalezas y debilidades en el diseño, evaluación del desempeño

## - Resultados: 

### -Modelo físico
Debido a las variaciones de las tolerancias de impresión, fue necesario ampliar algunos agujeros para asegurar el correcto encaje de las piezas. Para mejorar la fricción y optimizar la transmisión de movimiento, se decidió recubrir ciertos agujeros con cinta, lo cual también ayudó a reducir el juego en el brazo principal. Este ajuste resultó fundamental para minimizar el movimiento relativo entre los ejes y los acoples a los eslabones, mejorando la estabilidad general del mecanismo.

La fijación del primer motor a una tabla facilitó la implementación de un contrapeso improvisado; sin embargo, no fue suficiente para reducir las vibraciones. En respuesta, se incorporó una goma como base para distribuir y amortiguar mejor las vibraciones generadas durante el funcionamiento. Esta modificación ayudó a mejorar el rendimiento, pero las vibraciones aún representaron un desafío.

El uso de un motor con encoder resultó ventajoso para el montaje, pero complicó el control del sistema. Al ser un encoder de pulsos, fue necesario desarrollar un sistema de interrupciones que permitiera medir y generar la señal PWM simultáneamente, lo que incrementó la complejidad del control.

En cuanto a la geometría de los eslabones, se realizaron ajustes con el objetivo de reducir la carga sobre los motores, lo cual fue necesario también para mejorar el ensamblaje. Esto requirió la reimpresión de varias piezas para garantizar una adaptación adecuada.

En términos eléctricos, se optó por adquirir un driver independiente para cada motor. Sin embargo, uno de los drivers generaba valores de corriente inusualmente elevados, lo que provocaba un sobrecalentamiento y daños en algunos componentes del circuito, complicando la operación del sistema.

Adicionalmente, el motor ubicado en la parte superior del mecanismo tuvo que ser reemplazado debido a una falla en la rotación. Esta falla se originó por una inconsistencia en la caja reductora, la cual impedía el giro correcto del motor, afectando el desempeño del mecanismo.

Finalmente, el encoder ensamblado presentó problemas funcionales, lo que requirió su sustitución. Estos problemas se atribuyeron a la falta de compatibilidad entre los componentes, lo que afectó la precisión del sistema de control.

Al gestionar ambos motores con un puente H, se descubrió que la unión de las tierras entre el circuito de potencia y el de control interfería con la correcta lectura del encoder de pulsos, lo cual ocasionaba errores en el monitoreo de la posición y el control del sistema.

# PROCESO
Reflexiones del trabajo colaborativo, gestión de proyrecto y aprendizaje, máximo 6 páginas.
## - Gestión de Proyecto
## - Trabajo Colaborativo:
## - Trabajo de Aprendizaje:
## - Recomendaciones para Futuros trabajos de Aprendizaje Basado en Problemas orientado a Proyecto:
- Marcos Fierro:
- Joyner Caballero:
- Camilo Apraez:
