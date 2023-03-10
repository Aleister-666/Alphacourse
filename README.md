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
* Ruby version: 3.1.2 <= 3.2
* Postgresql: 15+
* libvips
* Gemas:
	- haml
	- annotate
	- devise
	- sassc-rails
	- rails-i18n
	- acts_as_list
	- requestjs-rails
	- font-awesome-sass
	- image_processing
	- Pagy
	- ViewComponent

#### Instalacion

Para instalar y poner a correr el sistema, debes de tener ruby, postgresql y libvips instalado en las versiones antes mencionadas y una vez que se cumplan esos requisitos.

- Abres una terminal/cmd
- Te mueves con cd hacia la carpeta del proyecto
- Corremos el comando: ./bin/setup | ruby ./bin/setup


Nota: En caso de tener error al crear la base de datos, deberas modificar el archivo database.yml ubicado en la carpeta config. Y cambiar el valor de los atributos "database", "username" y "password" a los valores correspondientes para tu usuario posgresql
