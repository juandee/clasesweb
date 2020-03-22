# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
rolAdmin = Role.create(name: 'admin')
rolTeacher = Role.create(name: 'teacher')
rolStudent = Role.create(name: 'student')

# usuario administrador
admin = User.create(email: 'admin@gmail.com', password: 'admin1234', name: 'Admin', surname: 'Admin', dni:'36252171', birthday:'20/06/1990')
assignment = Assignment.create(user_id: admin.id, role_id: rolAdmin.id)

#usuarios docentes
teacher1 = User.create(email: 'juan@gmail.com', password: 'juan1234', name: 'Juan', surname: 'Desiderio', dni:'37353181', birthday:'24/02/1993')
assignment = Assignment.create(user_id: teacher1.id, role_id: rolTeacher.id)

teacher2 = User.create(email: 'maria@gmail.com', password: 'maria1234', name: 'Maria', surname: 'Gonzalez', dni:'35353182', birthday:'10/08/1999')
assignment = Assignment.create(user_id: teacher2.id, role_id: rolTeacher.id)

teacher3 = User.create(email: 'sofia@gmail.com', password: 'sofia1234', name: 'Sofia', surname: 'Perez', dni:'38353161', birthday:'20/07/1997')
assignment = Assignment.create(user_id: teacher3.id, role_id: rolTeacher.id)

teacher4 = User.create(email: 'pedro@gmail.com', password: 'pedro1234', name: 'Pedro', surname: 'Martinez', dni:'39356181', birthday:'03/06/1995')
assignment = Assignment.create(user_id: teacher4.id, role_id: rolTeacher.id)

teacher5 = User.create(email: 'ismael@gmail.com', password: 'ismael1234', name: 'Ismael', surname: 'Rodriguez', dni:'37659181', birthday:'15/04/1994')
assignment = Assignment.create(user_id: teacher5.id, role_id: rolTeacher.id)

#Usuarios alumnos
student1 = User.create(email: 'ramiro@gmail.com', password: 'ramiro1234', name: 'Ramiro', surname: 'Orozco', dni:'38353121', birthday:'31/10/1992')
assignment = Assignment.create(user_id: student1.id, role_id: rolStudent.id)

student2 = User.create(email: 'lara@gmail.com', password: 'lara1234', name: 'Lara', surname: 'Sanchez', dni:'34356281', birthday:'15/08/1996')
assignment = Assignment.create(user_id: student2.id, role_id: rolStudent.id)

student3 = User.create(email: 'lautaro@gmail.com', password: 'lautaro1234', name: 'Lautaro', surname: 'Martinez', dni:'39486181', birthday:'13/05/1996')
assignment = Assignment.create(user_id: student3.id, role_id: rolStudent.id)

student4 = User.create(email: 'laura@gmail.com', password: 'laura1234', name: 'Laura', surname: 'Donofrio', dni:'36486251', birthday:'03/10/1999')
assignment = Assignment.create(user_id: student4.id, role_id: rolStudent.id)

student5 = User.create(email: 'raquel@gmail.com', password: 'raquel1234', name: 'Raquel', surname: 'Gomez', dni:'40486181', birthday:'23/03/1995')
assignment = Assignment.create(user_id: student5.id, role_id: rolStudent.id)

student6 = User.create(email: 'florencia@gmail.com', password: 'florencia1234', name: 'Florencia', surname: 'Paez', dni:'34256181', birthday:'27/01/1989')
assignment = Assignment.create(user_id: student6.id, role_id: rolStudent.id)

student7 = User.create(email: 'rogelio@gmail.com', password: 'rogelio1234', name: 'Rogelio', surname: 'Gonzalez', dni:'35486241', birthday:'10/11/1985')
assignment = Assignment.create(user_id: student7.id, role_id: rolStudent.id)

student8 = User.create(email: 'ludmila@gmail.com', password: 'ludmila1234', name: 'Ludmila', surname: 'Ramirez', dni:'38486223', birthday:'20/12/1988')
assignment = Assignment.create(user_id: student8.id, role_id: rolStudent.id)

student9 = User.create(email: 'mario@gmail.com', password: 'mario1234', name: 'Mario', surname: 'Sanchez', dni:'33456241', birthday:'01/06/1995')
assignment = Assignment.create(user_id: student9.id, role_id: rolStudent.id)

student10 = User.create(email: 'esteban@gmail.com', password: 'esteban1234', name: 'Esteban', surname: 'Gomez', dni:'32786241', birthday:'03/03/1999')
assignment = Assignment.create(user_id: student10.id, role_id: rolStudent.id)

student11 = User.create(email: 'camila@gmail.com', password: 'camila1234', name: 'Camila', surname: 'Acuña', dni:'38886498', birthday:'05/04/1996')
assignment = Assignment.create(user_id: student11.id, role_id: rolStudent.id)

student12 = User.create(email: 'roberto@gmail.com', password: 'roberto1234', name: 'Roberto', surname: 'Roldan', dni:'34966241', birthday:'22/07/1997')
assignment = Assignment.create(user_id: student12.id, role_id: rolStudent.id)

student13 = User.create(email: 'marta@gmail.com', password: 'marta1234', name: 'Marta', surname: 'Harf', dni:'38486255', birthday:'08/08/1999')
assignment = Assignment.create(user_id: student13.id, role_id: rolStudent.id)

student14 = User.create(email: 'lorena@gmail.com', password: 'lorena1234', name: 'Lorena', surname: 'Panza', dni:'35486120', birthday:'09/05/1996')
assignment = Assignment.create(user_id: student14.id, role_id: rolStudent.id)

student15 = User.create(email: 'mauro@gmail.com', password: 'mauro1234', name: 'Mauro', surname: 'Diez', dni:'37246241', birthday:'24/12/1993')
assignment = Assignment.create(user_id: student15.id, role_id: rolStudent.id)

#Cursos
course1 = Course.create(name: 'Introduccion a Ruby', descripcion: 'Curso introductorio de programacion en Ruby.', owner: teacher1)
course2 = Course.create(name: 'Manualidades', descripcion: 'Curso practico de manualidad para hacer en la casa.', owner: teacher2)
course3 = Course.create(name: 'Origami', descripcion: 'Aprenda el antiguo arte oriental de hacer figuras con papel sin salir de su casa.', owner: teacher2)
course4 = Course.create(name: 'Historia de la computacion', descripcion: 'Apasionante historia desde los principios de la computacion hasta los avances actuales.', owner: teacher4)
course5 = Course.create(name: 'Principios de desarrollo web', descripcion: 'Conocimientos basicos de HTML y CSS.', owner: teacher5)

#Alumnos del curso 1
attendant = Attendant.create(user_id: student1.id, course_id: course1.id)
attendant = Attendant.create(user_id: student3.id, course_id: course1.id)
attendant = Attendant.create(user_id: student5.id, course_id: course1.id)
attendant = Attendant.create(user_id: student7.id, course_id: course1.id)
attendant = Attendant.create(user_id: student9.id, course_id: course1.id)
attendant = Attendant.create(user_id: student11.id, course_id: course1.id)
attendant = Attendant.create(user_id: student13.id, course_id: course1.id)
attendant = Attendant.create(user_id: student15.id, course_id: course1.id)

#Alumnos del curso 2
attendant = Attendant.create(user_id: student2.id, course_id: course2.id)
attendant = Attendant.create(user_id: student4.id, course_id: course2.id)
attendant = Attendant.create(user_id: student6.id, course_id: course2.id)
attendant = Attendant.create(user_id: student8.id, course_id: course2.id)
attendant = Attendant.create(user_id: student10.id, course_id: course2.id)
attendant = Attendant.create(user_id: student12.id, course_id: course2.id)
attendant = Attendant.create(user_id: student14.id, course_id: course2.id)

#Alumnos del curso 3
attendant = Attendant.create(user_id: student1.id, course_id: course3.id)
attendant = Attendant.create(user_id: student2.id, course_id: course3.id)
attendant = Attendant.create(user_id: student3.id, course_id: course3.id)
attendant = Attendant.create(user_id: student4.id, course_id: course3.id)
attendant = Attendant.create(user_id: student5.id, course_id: course3.id)

#Alumnos del curso 4 
attendant = Attendant.create(user_id: student10.id, course_id: course4.id)
attendant = Attendant.create(user_id: student11.id, course_id: course4.id)
attendant = Attendant.create(user_id: student12.id, course_id: course4.id)
attendant = Attendant.create(user_id: student13.id, course_id: course4.id)
attendant = Attendant.create(user_id: student14.id, course_id: course4.id)
attendant = Attendant.create(user_id: student15.id, course_id: course4.id)