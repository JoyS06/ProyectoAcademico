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

![image](https://github.com/user-attachments/assets/951f2f8c-711b-4d6f-9fc7-6db80ad7d06a)

Estas expresiones permiten encontrar los torques necesarios para controlar el movimiento de cada eslabón del mecanismo. Dado que la solución completa de estas ecuaciones involucra cálculos matemáticos extensos, se ha utilizado la herramienta Wolfram Mathematica para resolverlas de manera eficiente. Los resultados obtenidos se graficaron en Matlab, mostrando los perfiles de torque en función del tiempo.

![image](https://github.com/user-attachments/assets/5158e597-2b31-4434-985b-221af15c2cee)

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

En cuanto a la geometría de los eslabones, se realizaron ajustes con el objetivo de reducir la carga sobre los motores, lo cual fue necesario también para mejorar el ensamblaje. Esto requirió la reimpresión de varias piezas para garantizar una adaptación adecuada.

Finalmente, el encoder ensamblado presentó problemas funcionales, lo que requirió su sustitución. Estos problemas se atribuyeron a la falta de compatibilidad entre los componentes, lo que afectó la precisión del sistema de control.

Al gestionar ambos motores con un puente H, se descubrió que la unión de las tierras entre el circuito de potencia y el de control interfería con la correcta lectura del encoder de pulsos, lo cual ocasionaba errores en el monitoreo de la posición y el control del sistema.

## Implementación de Software del Montaje

Para la implementación del proyecto, además de la selección de componentes y el análisis realizado mediante simulaciones, se optó por controlar el sistema utilizando una placa Arduino Uno. Esta elección se debió a la facilidad de uso de la placa y su amplia compatibilidad con diversas bibliotecas, lo que agilizó el desarrollo y permitió acceder a recursos ya disponibles para proyectos similares.

El primer paso en la implementación fue configurar la lectura de los encoders. Para esta tarea, era crucial comprender el funcionamiento de estos sensores. Los encoders utilizados en este proyecto son de efecto Hall, los cuales operan detectando un campo magnético generado por un imán fijado al eje del motor. A medida que el motor gira, el campo magnético varía, lo que provoca que las salidas del encoder se activen de manera periódica, enviando señales que corresponden a la posición angular del motor.

Este proceso de lectura es fundamental para obtener la retroalimentación necesaria para el control del sistema, ya que permite medir con precisión la posición y la velocidad del motor, aspectos esenciales para asegurar que el sistema funcione de acuerdo con las especificaciones establecidas en las simulaciones previas.

![image](https://github.com/user-attachments/assets/eb54e316-98ce-472a-b001-3a7512982681)

## Funcionamiento: 

Se llevaron a cabo diversas pruebas para analizar el comportamiento de la planta bajo un esquema de control de posición. Estas pruebas permitieron evaluar el rendimiento del sistema en diferentes condiciones operativas y ajustar los parámetros de control para optimizar su respuesta. A través de estas pruebas, se obtuvieron los siguientes resultados, los cuales proporcionaron una visión detallada de la precisión y estabilidad del sistema, así como su capacidad para seguir trayectorias definidas de manera efectiva.

# PROCESO

## - Gestión de Proyecto

Dinamica de las reuniones: Durante las primeras semanas de clase, se realizaron reuniones virtuales al menos una vez por semana, en las cuales cada miembro del equipo recibía una tarea específica de diseño para desarrollar. Posteriormente, en las reuniones, se compartía el progreso individual con el grupo, lo que permitía que todos comprendieran el trabajo realizado por los demás y se resolvieran las dudas que surgían. A medida que se acercaba la fecha límite del proyecto, las reuniones presenciales se intensificaron, llegando a realizarse hasta cinco veces por semana, con una duración promedio de 10 horas por sesión, extendiéndose en ocasiones hasta la madrugada, con el objetivo de finalizar el prototipo físico y realizar los ajustes necesarios.

Además, a medida que el proyecto avanzaba, la interacción entre los miembros del equipo se volvió más dinámica y colaborativa. Se promovió un ambiente de trabajo en el que todos podían aportar ideas y sugerencias para mejorar el diseño y la funcionalidad del prototipo, lo que resultó clave para enfrentar los desafíos técnicos. La presión por cumplir los plazos también fomentó un sentido de responsabilidad compartida, donde cada integrante del equipo se comprometía no solo con su parte del trabajo, sino también con el éxito global del proyecto.

Manejo de tiempos y recursos: La gestión del tiempo y los recursos fue clave para el avance del proyecto. Las tareas se asignaron a medida que transcurría el semestre y luego se discutían en las reuniones virtuales para asegurar una comprensión homogénea del trabajo entre todos los miembros del equipo. Se establecieron fechas límite para cada tarea, lo que ayudó a mantener un ritmo de trabajo constante y eficiente.

Los recursos económicos se dividieron equitativamente entre los integrantes, lo que permitió una distribución justa de los costos. Además, se aprovecharon otros recursos disponibles dentro del equipo, como herramientas y equipos de simulación que varios miembros poseían, lo que facilitó tanto la construcción física del prototipo como su análisis computacional. Estos recursos adicionales no solo optimizaron el uso del tiempo, sino que también permitieron que el equipo abordara problemas técnicos de manera más eficiente, mejorando la calidad y precisión del prototipo final.

Por ultimo, la interacción con el docente facilitador fue constante y productiva. Después de cada clase, el profesor estaba disponible para resolver cualquier duda, lo que fue de gran ayuda para el desarrollo del proyecto. Además, el trabajo colaborativo dentro del equipo fue clave: cada miembro tenía tareas asignadas que posteriormente socializaba con el grupo, permitiendo que todos comprendieran el progreso y contribuyeran al proyecto de manera equilibrada.

## - Trabajo Colaborativo:

Como se mencionó anteriormente, para el desarrollo de este proyecto se delegaron tareas específicas a cada integrante, y posteriormente se socializaban los avances en las reuniones para asegurar que el resto del grupo comprendiera el trabajo realizado por cada miembro. Este enfoque facilitó la coordinación y permitió que todos estuvieran al tanto del progreso global del proyecto, garantizando una integración eficiente de las diferentes partes.

A continuación, se presentan los principales aportes de cada miembro, reflejando cómo la colaboración permitió aprovechar al máximo las habilidades y conocimientos individuales, logrando un resultado final cohesivo y bien integrado.

Marcos Fierro: Diseño del mecanismo en Autodesk Inventor, simulación del sistema en Simulink, selección del motorreductor y apoyo en la construcción del prototipo.

El diseño del mecanismo se realizó utilizando Autodesk Inventor, una herramienta que permitió crear modelos tridimensionales precisos y visualizar el funcionamiento del sistema antes de su construcción. La simulación del sistema en Simulink fue clave para validar el comportamiento dinámico del mecanismo, lo que permitió ajustar parámetros y predecir el rendimiento bajo diferentes condiciones de operación.

Joyner Caballero: Diseño de los perfiles de movimiento: posición, velocidad y aceleración en función del tiempo. Análisis Lagrangiano para la determinación de los torques dinámicos en cada articulación, selección de motorreductores y construcción física del prototipo.

El diseño de los perfiles de movimiento incluyó el cálculo detallado de la posición, la velocidad y la aceleración de las articulaciones a lo largo del tiempo, lo que permitió definir con precisión el comportamiento del mecanismo. Mediante el análisis Lagrangiano, se determinaron los torques dinámicos necesarios en cada articulación, lo cual fue fundamental para seleccionar los motorreductores adecuados y garantizar que el sistema pudiera manejar las exigencias mecánicas.

Camilo Apraez: Obtención de los parámetros de modelado y caracterización de la planta, diseño del control proporcional y derivativo, puesta a punto del sistema de control. Apoyo en la obtención de los parámetros de modelado de los motorreductores.

Se realizó la obtención y caracterización de los parámetros clave de la planta, lo cual fue fundamental para desarrollar un modelo preciso del sistema. Posteriormente, se diseñó un control proporcional y derivativo (PD) para garantizar un desempeño estable y eficiente, ajustando las respuestas del sistema según las especificaciones requeridas. La puesta a punto del sistema de control fue un proceso crítico que incluyó pruebas y ajustes para asegurar que el comportamiento del sistema fuera óptimo bajo diversas condiciones operativas.

## - Proceso de aprendizaje:

- Marcos Fierro: El proyecto fue una excelente oportunidad para enfrentar las diversas dificultades y retos asociados con el control de diferentes tipos de motores. Me permitió entender la incidencia de las propiedades de cada motor en su funcionamiento y cómo estas características afectan el comportamiento del sistema en general. Además, pude observar cómo el grupo reaccionaba ante las adversidades y cómo, con un enfoque colectivo y organizado, logramos superar los obstáculos. Esta experiencia no solo reforzó mis habilidades técnicas, sino también mis capacidades de trabajo en equipo y resolución de problemas en situaciones de alta presión.

- Joyner Caballero: El proyecto me permitió desarrollar inquietudes importantes en varios de los temas tratados durante la asignatura. A medida que surgían preguntas o dificultades, pude apoyarme tanto en mis compañeros como en el profesor para resolverlas de manera colaborativa. Este enfoque de trabajo en equipo y consulta constante no solo facilitó el aprendizaje, sino que también permitió fortalecer el entendimiento de los conceptos aplicados. Enfrentar estos retos junto a un grupo comprometido y con el apoyo constante del docente fue clave para el éxito del proyecto.

- Camilo Apraez: Este proyecto fue un desafío que exigió poner en práctica múltiples conocimientos de manera simultánea. A través de él, adquirí una visión integral de lo que implica el diseño y funcionamiento de un servomecanismo, desde su concepción mecánica, regida por leyes físicas, hasta su implementación de control. Una lección clave fue la importancia de seleccionar los actuadores correctamente, considerando tanto el torque como el momento de inercia. Además, se refinan las técnicas de control y se profundiza en los parámetros que deben considerarse en el diseño. No es suficiente basarse en la intuición inicial; es fundamental un análisis más detallado para llevar el control a otro nivel. Finalmente, la implementación técnica debe tener en cuenta muchas variables, siendo una de las más críticas la frecuencia del puerto PWM, que influye significativamente en el comportamiento del sistema.

## - Recomendaciones para Futuros trabajos de Aprendizaje Basado en Problemas orientado a Proyecto:

- Marcos Fierro: Considero que sería extremadamente útil que las clases directamente relacionadas con el proyecto se impartieran al inicio del semestre. Esto nos permitiría avanzar en el desarrollo del proyecto de manera más continua y organizada, sin tener que detenernos para aprender conceptos clave a mitad del proceso. Un ejemplo concreto sería la clase sobre la caracterización de la planta, que es fundamental para entender cómo modelar el sistema. Si se impartiera esta clase al inicio, podríamos aplicar estos conocimientos desde las primeras etapas del diseño y simulación, lo que reduciría contratiempos y permitiría un progreso más fluido.

- Joyner Caballero: Sugiero que se implementen entregas intermedias a lo largo del semestre, para que el proyecto pueda desarrollarse de manera gradual y no se acumule todo el trabajo hacia el final. Este enfoque permitiría tener un seguimiento más preciso de lo que hemos realizado y recibir retroalimentación oportuna para hacer correcciones a tiempo. Además, creo que sería muy beneficioso contar con recomendaciones sobre marcas de componentes, especialmente cuando compramos en línea o en el extranjero, ya que hay muchas opciones de baja calidad. Evitaríamos caer en estafas, como suele ocurrir con algunos productos de origen chino, lo que podría retrasar el proyecto o afectar el rendimiento del prototipo.

- Camilo Apraez: Aunque me gusta la idea del proyecto, creo que se debería proporcionar más información a los estudiantes sobre los parámetros que deben tenerse en cuenta al implementar el hardware. Actualmente, la búsqueda de estos parámetros por cuenta propia puede hacer que el trabajo sea mucho más tedioso y complicado de lo necesario. Sería ideal que se explicaran estos aspectos con mayor profundidad desde el principio, para evitar retrasos o errores innecesarios. Además, creo que sería útil recibir más orientación en la parte del control del mecanismo, ya que es una sección crítica del proyecto. Tener más claridad sobre esta área mejoraría la calidad de nuestras soluciones y optimizaría el tiempo dedicado al desarrollo técnico.

## Referencias: 

[1] ”Motor DC con Encoder – Velocidad – Posición ”https://controlautomaticoeducacion.com/arduino/motor-dc-encoder/

[2] R. Munnig Schmidt, G. Schitter, A. Rankers, J. Van Eijk. The Design of High Performance Mechatronics: 2nd Edition: High-Tech Functionality by Multidisciplinary System Integration. Delft University Press, 2014.

[3] Kuo, Benjamin C., Automatic Control Systems, 7th edition, Prentice Hall, 1995.
