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
# PROCESO
Reflexiones del trabajo colaborativo, gestión de proyrecto y aprendizaje, máximo 6 páginas.
## - Gestión de Proyecto
## - Trabajo Colaborativo:
## - Trabajo de Aprendizaje:
## - Recomendaciones para Futuros trabajos de Aprendizaje Basado en Problemas orientado a Proyecto:
- Marcos Fierro:
- Joyner Caballero:
- Camilo Apraez:
