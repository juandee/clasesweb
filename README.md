# Sistema de cursos a distancia online

## Versión de Ruby

	* ruby 2.5.1p57

## Dependencias del sistema

	* Git
	* Rails
	* Bundler
	* SQLite
	* Devise
	* CanCanCan
	* Active Storage

## Información general

El proyecto modela una aplicación sencilla para el manejo de cursos online. El modelo cuenta con tres tipos de usuarios del sistema:

	* Un administrador.
	* Docentes.
	* Alumnos/as.

El objetivo principal es facilitar una herramienta para que los/as docentes puedan crear cursos con recursos tales como videos y documentos descargables para los/as alumnos/as.

Para el manejo de sesiones y registro de usuarios en el sistema se utiliza la gema Devise. 

Cualquier persona puede registrarse en el sistema, asignándose por defecto el rol de alumno. Solamente el usuario administrador puede asignar el rol de docente a usuarios registrados. El alumno registrado podrá entonces acceder a los cursos y actividades en los que se encuentre inscripto, así como participar del foro de consultas de las actividades de dicho curso.

El usuario con rol docente puede crear cursos, así como crear actividades y cargar videos y archivos (para lo cual el sistema usa Active Storage) para dichas actividades. Solamente puede acceder, editar o eliminar los cursos que le pertenecen, así como responder a las consultas realizadas por los alumnos en el foro de las actividades de dichos cursos. El docente a cargo del curso es el encargado de agregar o eliminar de su curso a los usuarios alumnos.

Por último, el usuario administrador tiene acceso total a toda la aplicación. Si bien no debería intervenir, tiene la capacidad para manejar todos los cursos y usuarios registrados en el sistema.

Las autorizaciones para cada tipo de usuario se realizaron utilizando la gema CanCanCan.


## Configuración del sistema

El primer paso es clonar el repositorio a su máquina local utilizando el comando `git clone` y moverse al directorio del mismo.

```bash
	$ git clone https://github.com/juandee/clasesweb
	$ cd clasesweb
```

Una vez clonado el repositorio y estando situado en la carpeta del mismo, debemos instalar las gemas necesarias mediante el uso de `Bundler`.

```bash
	$ bundle
```

## Creación de la base de datos

Para la migración de la base de datos debemos ejecutar el siguiente comando:

```bash
	$ rake db:migrate
```

Una vez creada la base de datos hay que ejecutar `rake db:seed` para cargar los datos:

```bash
	$ rake db:seed
```
Se proveen usuarios docentes, alumnos y administrador para evaluar los diferentes accesos. Además se proveen ejemplos de cursos creados, con videos y actividades adjuntas, así como consultas generadas en los foros.

## Puesta en marcha

Una vez ya instaladas las dependencias del proyecto y generada la base de datos, ya podrá poner en marcha el servidor, ejecutando:

```bash
	$ rails s
```

Una vez cargado el servidor ya podrá acceder a `http://localhost:3000`, donde se accede a la página de login del sitio, en donde deberá conocer el usuario y contraseña para poder ingresar.

## Tests

Para correr los tests se debe ejecutar el siguiente comando:

```bash
	$ rails test
```