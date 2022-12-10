administrator = {
	username: 'Administrador',
	email: 'admin@gmail.com',
	password: '12345678',
	role: :admin
}

estudiante = {
	username: 'Estudiante 1',
	email: 'student@gmail.com',
	password: '12345678',
}

User.create!(administrator)
User.create!(estudiante)


puts "Users created: #{User.all.size}"