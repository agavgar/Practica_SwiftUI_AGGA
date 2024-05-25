**Práctica para el módulo iOS Avanzado de Keepcoding.**

Esta práctica he tenido el placer de usar SwiftUI con herramientas más avanzadas. Desarrollada con el patrón MVVM y multiplataforma. Vale lo mismo para mac, ipad, móvil e iwatch. Descartando por tiempo tvOS.

**Resultado: APTO**

![Simulator Screenshot - iPhone 15 - 2024-05-05 at 20 29](https://github.com/agavgar/Practica_SwiftUI_AGGA/assets/98350985/8c9c3923-bd0b-437e-a15d-aa2428fa7750)
![Simulator Screenshot - iPhone 15 - 2024-05-05 at 20 30](https://github.com/agavgar/Practica_SwiftUI_AGGA/assets/98350985/2fabe1af-dd24-4432-b053-05a6b517105a)
![Simulator Screenshot - iPhone 15 - 2024-05-05 at 20 30-2](https://github.com/agavgar/Practica_SwiftUI_AGGA/assets/98350985/b5da40b2-5f9e-47bc-847c-0dc479c2d6db)
![Simulator Screenshot - Apple Watch Series 7 (45mm) - 2024-05-05 at 20 01](https://github.com/agavgar/Practica_SwiftUI_AGGA/assets/98350985/7c239f97-244e-42cd-92fe-f1a533c2e222)
![Simulator Screenshot - Apple Watch Series 7 (45mm) - 2024-05-05 at 20 04](https://github.com/agavgar/Practica_SwiftUI_AGGA/assets/98350985/674f7944-3fea-4919-9080-4ba6af1ba68b)
![Simulator Screenshot - Apple Watch Series 7 (45mm) - 2024-05-05 at 20 04-2](https://github.com/agavgar/Practica_SwiftUI_AGGA/assets/98350985/7ef3d7ed-78a4-4e28-aea5-e8853f5b125d)


**Breve descripción**

Por fin cambiamos de API, vamos a trabajar con la API de Marvel que a pesar de estar muy limitada, tiene algunos requisitos previos interesantes de ver. Lo primero es la encriptación de las claves + el timestamps en MD5. Luego sus requisitos para la muestra de imágenes es muy interesante. La práctica recibe los personajes de marvel y podemos ir a la vista detalle donde cargará un raíl de comics/series en los que aparece. Los trabajamos desde el APIProvider por asyn await (auténtica maravilla) y los actualizamos en una task.

**Guía de instalación**

Simplemente debemos descargarnos el prouyecto en ZIP o en HTTP y clonar el repositorio. Luego ejecutar el archivo del proyecto de xCode y con pulsar al play tendremos la aplicación funcionando. Solo usuarios con MAC y xCode instalado. Para iWatch hay que sincronizar el dispositivo con el xCode y de ahí lo ejecutamos dandole al play. Posiblemente se necesite alguna herramienta desarrollador para el reloj.

**Experiencia**

La verdad que he sentido un poco de aire fresco en el desarrollo de la aplicación. Lo primero es que la verdad que he sido una de esas personas cautivadas por SwiftUI. No creo que susituya a corto medio plazo a UIKit pero su lógica se combina tan bien con las herramientas de Swift que es como si ambos se hubieran creado juntos. Muy divertida de hacer ya quye hay que trabajar con dos vrsiones y ello hace que tu mente piense en dos estados por cada implementación. Poder trabajar con la API de Marvel tambnién da un poco de tablas y te hace salir de tu zona de confort. Muy contento con la práctica, que me llevó hasta el último día hacerla ya que el cambio a priori parece sencillo pero hay que conseguir el click en la cabeza.
