# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Admin', last_name: 'Admin', approved: true, is_admin: true, is_teacher: false, email: "admin@admin.com", password: "azeaze", password_confirmation: "azeaze")
User.create(first_name: 'Chuck', last_name: 'Norris', approved: true, is_admin: true, is_teacher: true, email: "norris@admin.com", password: "azeaze", password_confirmation: "azeaze")

User.create(first_name: 'John', last_name: 'McClane', approved: true, is_admin: false, is_teacher: true, email: "mcclane@gmail.com", password: "azeaze", password_confirmation: "azeaze")
User.create(first_name: 'Simon', last_name: 'Wietrich', approved: true, is_admin: false, is_teacher: false, email: "simonwietrich@gmail.com", password: "azeaze", password_confirmation: "azeaze")

Subject.create([
    {name: "Piège de cristal pour les nuls", owner: User.second, start_date: Date.today, finish_date: Date.new(2025,01,01)}
])