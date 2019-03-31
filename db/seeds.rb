# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Department.delete_all
Department.create!(
    name: 'Computer Science',
    total_budget: 1000,
    manager_ssn: 123456789
    )

Department.create!(
    name: 'Math',
    total_budget: 1000,
    manager_ssn: 223456789
    )
    
Department.create!(
    name: 'English',
    total_budget: 1000,
    manager_ssn: 323456789
    )