administrator = {
	username: 'Administrador',
	email: 'admin@gmail.com',
	password: '12345678',
	role: :admin
}


User.create!(administrator)


puts "Se ha creado un usuario administrator con los siguientes datos:\n#{administrator}"