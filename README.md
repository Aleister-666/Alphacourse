# Alphacourse

Sistema tutorial para el aprendizaje del uso educactivo de la plataforma moodle para profesores. Creado con Ruby on Rails + Turbo + Stimulus
Modalidad Cursos Online

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
- Instalar gemas necesarias con el comando: bundle install
- Configuramos la base de datos y corremos las migraciones con el comando: rails db:setup
- Compilamos el css y corremos la aplicacion con el comando: ./bin/dev O ruby ./bin/dev

Nota: En caso de tener error al crear la base de datos, modificar el archivo database.yml ubicado en la carpeta config. y establecer los datos correspondientes a usuario, contraseña y nombre de base de datos de ser necesario 