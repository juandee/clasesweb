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