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
admin = User.create(email: 'admin@admin.com', password: 'admin1234', name: 'Admin', surname: 'Admin')
assigment = Assignment.create(user_id: admin.id, role_id: rolAdmin.id)

#usuario docente
teacher1 = User.create(email: 'juan@juan.com', password: 'juan1234', name: 'Juan', surname: 'Desiderio')
assigment = Assignment.create(user_id: teacher1.id, role_id: rolTeacher.id)