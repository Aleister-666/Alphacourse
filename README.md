# Alphacourse

Sistema De Cursos Online Para El Aprendizaje Educativo Creado Con Ruby On Rails + Turbo + Stimulus

## Caracteristicas
* Administrador:
	- Gestion de Secciones
	- Gestion de Cursos
	- Gestion de Pruebas
	- Gestion de Articulos
	- Inspeccionar y Eliminar Usuarios(Admin y estudiante)
	- Control Total
* Usuario Normal:
	- Crear cuenta de Estudiante
	- Incribirse a los cursos
	- Ver Paginas
	- Presentar Pruebas
	- Completar Cursos
	- Ver Articulos

### Requisitos
* Ruby version: 3.1.2+
* Postgresql: 15+
* libvips: 8.6+

#### Instalacion
Una vez cumplidos los requisitos, puedes proceder con la instalacion del sistema. *Es necesario que todos los requisitos esten cumplidos correctamente antes de continuar, de lo contrario pueden surgir problemas durante el proceso de instalacion*


##### Linux

###### Instalacion automatica:

	1- Primero tienes que abrir una terminal y despues con el comando cd, desplazarte hasta la carpeta del proyecto.

	2- Despues correr el siguiente comando: *./bin/setup* este comando instalara las gemas/librerias necesarias para correr la aplicacion, ademas de que preparara la base de datos, compilara el css y arrancara la aplicacion.

	 Nota: Si el comando da un error de permiso denegado, puedes probar usar darle permisos con *chmod 777* ademas de usar la opcion -x para hacerlo un ejecutable, y despues puedes intentar correrlo de nuevo. si aun no funciona. puedes tambien usar el comando ruby ./bin/setup en su lugar.

###### Instalacion Manual:

	1- Primero tienes que abrir una terminal y despues con el comando cd, desplazarte hasta la carpeta del proyecto.

	2- Despues debes de correr el comando: *bundle install* este instalara las gemas/librerias necesarias por el sistema.

	3- Una vez terminado correctamente el comando anterior, debes de correr el siguiente comando: *rails db:prepare* Este comando creara la base de datos, generara las tablas y su estructura, y correra la semilla con datos predeterminados. Nota: para ver dichos datos dirigaje al archivo app/db/seeds.rb el cual contiene los datos predeterminados del usuario administrador (esto puede cambiarlo a su gusto antes de preparar la base de datos). Y En caso de tener error al crear la base de datos, deberas modificar el archivo database.yml ubicado en la carpeta config. Y cambiar el valor de los atributos "database", "username" y "password" a los valores correspondientes para tu usuario posgresql

	4- Despues de preparada la base de datos. debe de compilar el tailwindcss con el comando: *rails tailwindcss:watch* Nota: Cada vez que realize un cambio en los estilos css, debera de tener corriendo este comando. de lo contrario los cambios no seran reflejados. por eso se aconseja tener 2 terminales abiertas y en una de ellas mantener este comando activo.

	5- Despues de compilar el css. solo queda poner a correr la aplicacion, para eso usamos el comando: *rails s* para iniciarlo. que por lo general corre en la uri http://localhost:3000 | http://127.0.0.1:3000 Nota: Si ya compilo el css y no va a cambiar ningun estilo. puede correr el comando anterior una vez, y despues que se compile el css, cancelar la ejecucion y correr este comando solamente.

##### Windows

###### Instalacion Automatica:

	1- Primero tienes que abrir una terminal y despues con el comando cd, desplazarte hasta la carpeta del proyecto.

	2- Despues correr el siguiente comando: *ruby ./bin/setup* este comando instalara las gemas/librerias necesarias para correr la aplicacion, ademas de que preparara la base de datos, compilara el css y arrancara la aplicacion.


###### Instalacion Manual:

	1- Primero tienes que abrir una terminal y despues con el comando cd, desplazarte hasta la carpeta del proyecto.

	2- Despues debes de correr el comando: *bundle install* este instalara las gemas/librerias necesarias por el sistema.

	3- Una vez terminado correctamente el comando anterior, debes de correr el siguiente comando: *rails db:prepare* Este comando creara la base de datos, generara las tablas y su estructura, y correra la semilla con datos predeterminados. Nota: para ver dichos datos dirigaje al archivo app/db/seeds.rb el cual contiene los datos predeterminados del usuario administrador (esto puede cambiarlo a su gusto antes de preparar la base de datos). Y En caso de tener error al crear la base de datos, deberas modificar el archivo database.yml ubicado en la carpeta config. Y cambiar el valor de los atributos "database", "username" y "password" a los valores correspondientes para tu usuario posgresql

	4- Despues de preparada la base de datos. debe de compilar el tailwindcss con el comando: *rails tailwindcss:watch* Nota: Cada vez que realize un cambio en los estilos css, debera de tener corriendo este comando. de lo contrario los cambios no seran reflejados. por eso se aconseja tener 2 terminales abiertas y en una de ellas mantener este comando activo.

	5- Despues de compilar el css. solo queda poner a correr la aplicacion, para eso usamos el comando: *rails s* para iniciarlo. que por lo general corre en la uri http://localhost:3000 | http://127.0.0.1:3000 Nota: Si ya compilo el css y no va a cambiar ningun estilo. puede correr el comando anterior una vez, y despues que se compile el css, cancelar la ejecucion y correr este comando solamente.