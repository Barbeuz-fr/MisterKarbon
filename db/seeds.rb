# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "reset database"

EmissionModule.destroy_all
User.destroy_all
Orga.destroy_all
Report.destroy_all
Company.destroy_all

p "create company"

company = Company.create!(name: "Strawberry")

# ==============================================================================
# USERS
# ==============================================================================

p "Create users"

puts 'Creating 100 fake users...'

100.times do
    user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{Faker::Name.first_name}.#{Faker::Name.first_name}@gmail.com",
    # pour job position et organisation position, peut etre mettre un array.sample
    #sur ce qui nous interesse
    job_position: Faker::Job.title,
    organization_position: Faker::Job.position,
    password: "qwerty123",
    company_id: company.id
    )
    user.save!
end

puts 'USER DONE!'

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

p "create reports"
report_1 = Report.new(name: "Projet1", year: 2020, user_id: User.first.id, company_id: company.id)
report_1.save

p "create emission_modules"

p "scope 1"
comb_fossiles = EmissionModule.create!(name: "Combustibles fossiles", scope: 1)
comb_organiques = EmissionModule.create!(name: "Combustibles organiques", scope: 1 )
changement_affectation_sols = EmissionModule.create!(name: "Changement affectation des sols", scope: 1)
deforestation = EmissionModule.create!(name: "Deforestation & reforestation", scope: 1)
refrigeration = EmissionModule.create!(name: "Refrigération", scope: 1)
clim = EmissionModule.create!(name: "Climatisation", scope: 1)
agriculture = EmissionModule.create!(name: "Agriculture", scope: 1)
process_industriels = EmissionModule.create!(name: "Process industriels", scope: 1)
dechets = EmissionModule.create!(name: "Déchets", scope: 1)


p "scope 2"
electricite = EmissionModule.create!(name: "Electricité", scope: 2)
reseaux_chaleur_froid = EmissionModule.create!(name: "Réseaux de chaleur et froid", scope: 2)

p "scope 3"
transport_marchandise_routier = EmissionModule.create!(name: "Transport routier de marchandises", scope: 3)
transport_marchandise_ferroviaire = EmissionModule.create!(name: "Transport ferroviaire de marchandises", scope: 3)
transport_marchandise_aerien = EmissionModule.create!(name: "Transport aérien de marchandises", scope: 3)
transport_marchandise_maritime = EmissionModule.create!(name: "Transport maritime de marchandises", scope: 3)
transport_marchandise_fluvial = EmissionModule.create!(name: "Transport fluvial de marchandises", scope: 3)

transport_personne_routier = EmissionModule.create!(name: "Transport routier de personnes", scope: 3)
transport_personne_ferroviaire = EmissionModule.create!(name: "Transport ferroviaire de personnes", scope: 3)
transport_personne_aerien = EmissionModule.create!(name: "Transport aérien de personnes", scope: 3)
transport_personne_maritime = EmissionModule.create!(name: "Transport maritime de personnes", scope: 3)
transport_personne_fluvial = EmissionModule.create!(name: "Transport fluvial de personnes", scope: 3)

achat_produit_agri = EmissionModule.create!(name: "Achat de produits agricoles", scope: 3)
achat_bois_papier_carton = EmissionModule.create!(name: "Achat de bois, papier, carton", scope: 3)
achat_mineraux = EmissionModule.create!(name: "Achat de minéraux & produits métalliques", scope: 3)
achat_machines = EmissionModule.create!(name: "Achat de machines et équipements", scope: 3)
achat_vehicules = EmissionModule.create!(name: "Achat de véhicules", scope: 3)
achat_mobiliers = EmissionModule.create!(name: "Achat de mobiliers", scope: 3)
achat_textiles = EmissionModule.create!(name: "Achat de textiles et habits", scope: 3)
batiment = EmissionModule.create!(name: "Construction de batiment", scope: 3)
voirie = EmissionModule.create!(name: "Construction de voirie", scope: 3)
eau = EmissionModule.create!(name: "Traitement de l'eau", scope: 3)
consommables = EmissionModule.create!(name: "Consommables de bureaux", scope: 3)
dechets = EmissionModule.create!(name: "Traitement des", scope: 3)



