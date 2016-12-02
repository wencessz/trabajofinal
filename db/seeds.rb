# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Prepopulate categories
Category.create(name: 'Departamento')
Category.create(name: 'Casa')
Category.create(name: 'Duplex')
Category.create(name: 'PH')
Category.create(name: 'Loft')
Category.create(name: 'Local Comercial')
Category.create(name: 'Oficina')


# User.create(
#   name: 'Administrador',
#   phone: '123456789',
#   email: 'admin@admin.com',
#   password: '12345678',
#   location: 'Somewhere In Galactic'
# )

# 2.3.0 :002 > user = User.new
#  => #<User id: nil, name: nil, phone: nil, location: nil, created_at: nil, updated_at: nil, email: "", last_seen: nil>
# 2.3.0 :003 > user.name = "Administrador"
#  => "Administrador"
# 2.3.0 :004 > user.phone = "123456789"
#  => "123456789"
# 2.3.0 :005 > user.email = "admin@admin.com"
#  => "cambiarme@me.com"
# 2.3.0 :006 > user.password = "adminadmin"
#  => "admin"
# 2.3.0 :007 > user.save
# 2.3.0 :008 > user.name
#  => "Administrador"
# 2.3.0 :009 > user.add_role "admin"
