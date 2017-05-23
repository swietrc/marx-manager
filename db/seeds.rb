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
u1 = User.create(first_name: 'Simon', last_name: 'Wietrich', approved: true, is_admin: false, is_teacher: false, email: "simonwietrich@gmail.com", password: "azeaze", password_confirmation: "azeaze")

s1 = Subject.create([
    {name: "Piège de cristal pour les nuls", owner: User.second, start_date: Date.today, finish_date: Date.new(2025,01,01)},
    {name: "Les films d'actions pour les nuls", owner: User.second, start_date: Date.today, finish_date: Date.new(2054,01,01)},
    {name: "Le web pour les prépas", owner: User.third, start_date: Date.today, finish_date: Date.new(2054,01,01)}
])

e1 = Exam.create(name: "Marcher sur du verre pilé", date: Date.today)
e2 = Exam.create(name: "Javascript. Bien ou pas bien ?", date: Date.today)

s1[0].exams << e1
s1[2].exams << e2

15.times do
    name = Faker::HarryPotter.character.split(' ')
    if name.count > 1
        password = "password"
        User.create!(first_name: name[0], last_name: name[1], email: Faker::Internet.email, password: password, password_confirmation: password, approved: true, is_teacher: false, is_admin: false)
    end
end

20.times do
    name = Faker::HarryPotter.character.split(' ')
    if name.count > 1
        password = "password"
        us1 = User.create!(first_name: name[0], last_name: name[1], email: Faker::Internet.email, password: password, password_confirmation: password, approved: true, is_teacher: false, is_admin: false)
        Subject.first.students << us1
        e1.exams_students << ExamStudent.new(grade: Random.rand(20), student_id: us1.id)
    end
end

10.times do
    name = Faker::GameOfThrones.character.split(' ')
    if name.count > 1
        password = "password"
        us1 = User.create!(first_name: name[0], last_name: name[1], email: Faker::Internet.email, password: password, password_confirmation: password, approved: true, is_teacher: false, is_admin: false)
        s1[2].students << us1
        e2.exams_students << ExamStudent.new(grade: Random.rand(20), student_id: us1.id)
    end
end




