# Proyecto Académico para la materia de Servomecanismos
Integrates: Marcos Fierro Sarria, Joyner Caballero Abril, Camilo Zamora Apraez

Profesor: Víctor Hugo Grisales Palacios.

Universidad Nacional de Colombia Sede Bogotá

Facultad de Ingeniería

2024

# PRODUCTO
Informe técnico de ingeniería, máximo 20 páginas más anexos
## - Análisis y Diseño de Ingeniería:
- Objetivos y alcance: El siguiente proyecto tiene como finalidad el desarrollo integral de un manipulador planar de dos grados de libertad que dibuje tréboles de n hojas a través del control automático. El trabajo abarca desde la conceptualización del brazo hasta el el diseño y contrucción del mismo y se espera que la puesta en escena del proyecto facilite el aprendizaje del trabajo colaborativo y el desarrollo de habilidades prácticas de cada integrante.
- Marco Teórico: Cinemática de robots y su aplicación en el brazo,Planificación de trayectorias,Control
La trayectoria se definió en dos partes. Una que lleva al mecanismo desde la posición de recogido hasta la posición en la que empieza a dibujar el trébol. Este a su vez se modeló como una función polar parametrizada, esto se hace para cambiar la cantidad de hojas, la profundidad de las mismas, su factor de rotación y su factor de escala.
- Diseño conceptual: 
Dado el requerimiento de un mecanismo planar con dos grados de libertad, se propuso un manipulador serial de dos eslabones como solución inicial. Esta configuración requiere, a su vez, de dos actuadores independientes para controlar la posición de cada articulación.

- Diseño detallado: Una vez finalizado el diseño conceptual, se procedió a modelar las piezas individuales del mecanismo en Autodesk Inventor. Los modelos tridimensionales resultantes, en formato STL, se encuentran almacenados en la carpeta "Modelos". Dada la complejidad geométrica de algunas piezas y la necesidad de obtener prototipos rápidamente, se optó por usar impresión 3D. El material seleccionado para la impresión fue PLA, ya que es una opción adecuada para prototipado y aplicaciones donde no se requieren propiedades mecánicas extremas. En la siguiente imagen se presenta una vista del ensamble de la parte mecánica del mecanismo.

![image](https://github.com/user-attachments/assets/c2a191e6-cfbc-49ae-b5e4-586aeb06a1e6)


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
