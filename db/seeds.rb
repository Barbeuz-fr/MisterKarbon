# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "reset database"

Report.destroy_all
User.destroy_all
Company.destroy_all


p "create company"

company = Company.create!(name: "Strawberry")

p "create orga"

orga1 = Orga.new(name: "Supply Chain")
orga1.company = company
orga1.save

orga1 = Orga.new(name: "Manufacturing")
orga1.company = company
orga1.save

orga1 = Orga.new(name: "Marketing")
orga1.company = company
orga1.save

orga1 = Orga.new(name: "Sales")
orga1.company = company
orga1.save

orga1 = Orga.new(name: "Finance")
orga1.company = company
orga1.save

p "create emission_modules"

combfossiles = EmissionModule.create!(name: "Combustibles fossiles")
comborganiques = EmissionModule.create!(name: "Combustibles organiques")
changement_affectation_sols = EmissionModule.create!(name: "Changement affectation des sols")
deforestation = EmissionModule.create!(name: "Deforestation & reforestation")

