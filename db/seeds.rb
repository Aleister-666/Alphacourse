administrator = {
	username: 'admin',
	email: 'admin@gmail.com',
	password: '12345678',
	role: :admin
}

User.create!(administrator)


puts "Users created: #{User.all.size}"