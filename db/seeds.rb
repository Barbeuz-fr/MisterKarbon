# TO DO

# ajout du scope détaillé pour un exemple de projet
# chargement du csv ADEME formatté
# ajout des questions pour 1 module electricité et 1 module transport
# ajout des réponses pour un exemple de projet


# ==============================================================================
# RESET
# ==============================================================================


p "reset database"

EmissionModule.destroy_all
Orga.destroy_all
Answer.destroy_all
ReportScopeOrgaUser.destroy_all
ReportScopeOrga.destroy_all
ReportScope.destroy_all
Report.destroy_all
User.destroy_all
Company.destroy_all

# ==============================================================================
# COMPANY
# ==============================================================================


p "create company"

company = Company.create!(name: "Strawberry")

# ==============================================================================
# USERS
# ==============================================================================

p "Create users"

puts 'Creating 10 fake users...'

manager = User.new(
  first_name: "JC",
  last_name: "Bertrand"
  )
manager.save

10.times do
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


# ==============================================================================
# ORGA
# ==============================================================================


p "create orga"

supply_chain = Orga.new(name: "Supply Chain")
supply_chain.company = company
supply_chain.save

manufacturing = Orga.new(name: "Manufacturing")
manufacturing.company = company
manufacturing.save

marketing = Orga.new(name: "Marketing")
marketing.company = company
marketing.save

sales = Orga.new(name: "Sales")
sales.company = company
sales.save

finance = Orga.new(name: "Finance")
finance.company = company
finance.save

prod_dev = Orga.new(name: "Product Development")
prod_dev.company = company
prod_dev.save

# ==============================================================================
# REPORTS
# ==============================================================================


p "create reports"

report_1 = Report.new(
  name: "Manufacturing",
  year: 2019)
report_1.company_id = company.id
report_1.user_id = manager.id
report_1.save



report_2 = Report.new(
  name: "Product Development",
  year: 2019)
report_2.company_id = company.id
report_2.user_id = manager.id
report_2.save


# ==============================================================================
# EMISSION MODULES
# ==============================================================================


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

# ==============================================================================
# REPORT 1 SCOPES
# ==============================================================================

# Report 1 : combustibles fossibles, process industriels, refrigeration, dechets,
# electricité

p "report 1 scopes: combustibles, process, refrigeration, dechet, electricité"

report1_scope1 = ReportScope.new(
  deadline: DateTime.new(2020,6,1),
  status: "To send")
report1_scope1.report_id = report_1.id
report1_scope1.emission_module_id = comb_fossiles.id
report1_scope1.save

report1_scope2 = ReportScope.new(
  deadline: DateTime.new(2020,6,1),
  status: "To send")
report1_scope2.report_id = report_1.id
report1_scope2.emission_module_id = process_industriels.id
report1_scope2.save

report1_scope3 = ReportScope.new(
  deadline: DateTime.new(2020,6,1),
  status: "To send")
report1_scope3.report_id = report_1.id
report1_scope3.emission_module_id = refrigeration.id
report1_scope3.save

report1_scope4 = ReportScope.new(
  deadline: DateTime.new(2020,6,1),
  status: "To send")
report1_scope4.report_id = report_1.id
report1_scope4.emission_module_id = dechets.id
report1_scope4.save

report1_scope5 = ReportScope.new(
  deadline: DateTime.new(2020,6,1),
  status: "To send")
report1_scope5.report_id = report_1.id
report1_scope5.emission_module_id = electricite.id
report1_scope5.save

# ==============================================================================
# REPORT 1 SCOPE ORGAS
# ==============================================================================

# Report 1 uniquement sur le manufacturing

p "report 1 scope orga (manufacturing)"

report1_scope1_orga = ReportScopeOrga.new(
  report_scope_id:report1_scope1.id,
  orga_id: manufacturing.id
  )
report1_scope1_orga.save


report1_scope2_orga = ReportScopeOrga.new(
  report_scope_id:report1_scope2.id,
  orga_id: manufacturing.id
  )
report1_scope2_orga.save


report1_scope3_orga = ReportScopeOrga.new(
  report_scope_id:report1_scope3.id,
  orga_id: manufacturing.id
  )
report1_scope3_orga.save


report1_scope4_orga = ReportScopeOrga.new(
  report_scope_id:report1_scope4.id,
  orga_id: manufacturing.id
  )
report1_scope4_orga.save


report1_scope5_orga = ReportScopeOrga.new(
  report_scope_id:report1_scope5.id,
  orga_id: manufacturing.id
  )
report1_scope5_orga.save

# ==============================================================================
# REPORT1 SCOPE ORGA USERS
# ==============================================================================

p "Report scope orga users"
# 5 profils associes aux 5 perimetres


report1_scope1_orga_user = ReportScopeOrgaUser.new(
  user_id: 1,
  report_scope_orga_id: report1_scope1_orga.id
  )
report1_scope1_orga_user.save

report1_scope2_orga_user = ReportScopeOrgaUser.new(
  user_id: 2,
  report_scope_orga_id: report1_scope2_orga.id
  )
report1_scope2_orga_user.save

report1_scope3_orga_user = ReportScopeOrgaUser.new(
  user_id: 3,
  report_scope_orga_id: report1_scope3_orga.id
  )
report1_scope3_orga_user.save

report1_scope4_orga_user = ReportScopeOrgaUser.new(
  user_id: 4,
  report_scope_orga_id: report1_scope4_orga.id
  )
report1_scope4_orga_user.save

report1_scope5_orga_user = ReportScopeOrgaUser.new(
  user_id: 5,
  report_scope_orga_id: report1_scope5_orga.id
  )
report1_scope5_orga_user.save


# ==============================================================================
# QUESTIONS
# ==============================================================================


# ==============================================================================
# REPORT EXAMPLE ANSWERS
# ==============================================================================



