# ==============================================================================
# REQUIRE
# ==============================================================================

require "open-uri"
# # ajout photo pour users et emission_module
# # ajout orga à 2 ou 3 niveaux

# ==============================================================================
# RESET SEED
# ==============================================================================

  p "reset database"

  ReportScopeOrgaUser.destroy_all
  ReportScopeOrga.destroy_all
  Orga.destroy_all
  Answer.destroy_all
  Question.destroy_all
  # AdemeEmissionFactor.destroy_all
  ReportScope.destroy_all
  Report.destroy_all
  User.destroy_all
  Company.destroy_all
  EmissionModule.destroy_all

# ==============================================================================
# IMAGES REPORTS
# ==============================================================================

  p "save images report"
  report_1_file = URI.open('https://images.unsplash.com/photo-1560574188-6a6774965120?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80')
  report_2_file = URI.open('https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1302&q=80')
  report_3_file = URI.open('https://images.unsplash.com/photo-1524684009724-bee13ad8305f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=716&q=80')

# ==============================================================================
# IMAGES EMISSION MODULES
# ==============================================================================

  p "save images report"
  emission_1_forest = 'https://www.pexels.com/photo/green-pine-trees-1179229/'


# ==============================================================================
# IMAGES AVATAR
# ==============================================================================

  avatar_1_file = URI.open('https://www.aquinum.fr/images/comprofiler/632_5bf032441a375.jpg')
  avatar_2_file = URI.open('https://3wpie932p5cn1pgjba40gtkbm83-wpengine.netdna-ssl.com/wp-content/uploads/2018/10/Julien-Lachance.jpg')
  avatar_3_file = URI.open('http://www.agenceartistique.com/DATA/PHOTO/359_grande.jpg')


# ==============================================================================
# IMAGES ORGA
# ==============================================================================

# --------------------------------------------------------------------------------------
# IMPORTATION CSV ADEME
# ==============================================================================


  # p "starting csv import ADEME"
  # require 'csv'

  # count = 0
  # csv_text = File.read(Rails.root.join('lib', 'seeds', 'csv_for_seed.csv'))
  # csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  # csv.each do |row|
  #   count += 1
  #   t = AdemeEmissionFactor.new()
  #   t.count = count
  #   p row['Code de la catégorie']
  #   t.name = row['Code de la catégorie']
  #   t.emission_value = row['Somme de Total poste non décomposé2']
  #   p t.emission_value
  #   t.unit = row['Unité anglais']
  #   t.id_ademe = row["Identifiant de l'élément"]
  #   t.nom_base = row['Nom base français']
  #   t.save
  # end

  # p "import done"

  # p "last line ADEME emission factor"
  # p AdemeEmissionFactor.last

  # p "count ADEME line"
  # AdemeEmissionFactor.count

# ==============================================================================
# COMPANY
# ==============================================================================

  p "create company"

  company = Company.create!(name: "Bread & Co")

  p company.name

  supplier_logistique = Company.create!(name: "Norbert Transport")

  p supplier_logistique.name

  supplier_mineraux = Company.create!(name: "Aremis")

  p supplier_mineraux.name

  supplier_IT = Company.create!(name: "IT & co")

  p supplier_IT.name


# ==============================================================================
# ORGA
# ==============================================================================

  p "create orga"

  supply_chain = Orga.new(name: "Supply Chain")
  supply_chain.company = company
  supply_chain.photo.attach(
    io: File.open(Rails.root.join('app', 'assets', 'images', 'organisation', 'supply-chain.png')),
    filename: 'supply-chain.png', content_type: 'image/png')
  supply_chain.save

  manufacturing = Orga.new(name: "Manufacturing")
  manufacturing.company = company
  manufacturing.photo.attach(
    io: File.open(Rails.root.join('app', 'assets', 'images', 'organisation', 'manufacturing.png')),
    filename: 'manufacturing.png', content_type: 'image/png')
  manufacturing.save

  rd = Orga.new(name: "R&D")
  rd.company = company
  rd.photo.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'organisation', 'rd.png')),
  filename: 'rd.png', content_type: 'image/png')
  rd.save

  product_development = Orga.new(name: "Product Development")
  product_development.company = company
  product_development.photo.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'organisation', 'product-dev.png')),
  filename: 'product-dev.png', content_type: 'image/png')
  product_development.save

  marketing = Orga.new(name: "Marketing")
  marketing.company = company
  marketing.photo.attach(
    io: File.open(Rails.root.join('app', 'assets', 'images', 'organisation', 'marketing.png')),
    filename: 'marketing.png', content_type: 'image/png')
  marketing.save

  sales = Orga.new(name: "Sales")
  sales.company = company
  sales.photo.attach(
    io: File.open(Rails.root.join('app', 'assets', 'images', 'organisation', 'sales.png')),
    filename: 'sales.png', content_type: 'image/png')
  sales.save

  finance = Orga.new(name: "Finance")
  finance.company = company
  finance.photo.attach(
    io: File.open(Rails.root.join('app', 'assets', 'images', 'organisation', 'finance.png')),
    filename: 'finance.png', content_type: 'image/png')
  finance.save

  hr = Orga.new(name: "HR")
  hr.company = company
  hr.photo.attach(
    io: File.open(Rails.root.join('app', 'assets', 'images', 'organisation', 'hr.png')),
    filename: 'hr.png', content_type: 'image/png')
  hr.save

# ==============================================================================
# USERS
# ==============================================================================
  p "Create users"

  puts 'Creating 10 fake users...'

  manager = User.new(
    first_name: "JC",
    email: "jean-charles.bertrand@gmail.com",
    password: 123456,
    organization_position: "CSR EMEA",
    job_position: "CSR manager",
    last_name: "Bertrand",
    company_id: company.id,
    )
  manager.photo.attach(io: avatar_1_file, filename: 'avatar_1.jpg', content_type: 'image/jpg')
  manager.save
  p manager
  p manager.first_name


  p "Generation des users pour les orgas"

  orga_pour_faker = ["Marketing", "Manufacturing", "Suppy Chain", "HR", "Finance", "Product Development"]
  orga_pour_faker.each do |orga|
    10.times do
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        user = User.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: "#{first_name}.#{last_name}@breadandco.com",
        # pour job position et organisation position, peut etre mettre un array.sample
        #sur ce qui nous interesse
        job_position: Faker::Job.title,
        organization_position: orga,
        password: "qwerty123",
        company_id: company.id
        )
        user.save!
    end
  end

  company_employee_1 = User.new(
    first_name: "Germain",
    last_name: "Dubreuil",
    email: "germain.dubreuil@breadandco.com",
    password: "123456",
    company_id: company.id,
    )
  company_employee_1.photo.attach(io: avatar_2_file, filename: 'avatar_1.jpg', content_type: 'image/jpg')
  company_employee_1.save

  company_employee_2 = User.new(
    first_name: "Antoine",
    last_name: "Fraveaux",
    email: "Antoine.Fraveaux@breadandco.com",
    password: "123456",
    company_id: company.id,
    )
  company_employee_2.photo.attach(io: avatar_3_file, filename: 'avatar_1.jpg', content_type: 'image/jpg')
  company_employee_2.save

  company_employee_3 = User.new(
    first_name: "Jeremy",
    last_name: "Kerviel",
    email: "Jeremy.Kerviel@breadandco.com",
    password: "123456",
    company_id: company.id,
    )
  # company_employee_3.photo.attach(io: avatar_1_file, filename: 'avatar_1.jpg', content_type: 'image/jpg')
  company_employee_3.save

  company_employee_4 = User.new(
    first_name: "Greta",
    last_name: "Garbo",
    email: "Greta.Garbo@breadandco.com",
    password: "123456",
    company_id: company.id,
    )
  # company_employee_4.photo.attach(io: avatar_1_file, filename: 'avatar_1.jpg', content_type: 'image/jpg')
  company_employee_4.save

  company_employee_5 = User.new(
    first_name: "Jason",
    last_name: "Statham",
    email: "Jason.Statham@breadandco.com",
    password: "123456",
    company_id: company.id,
    )
  # company_employee_5.photo.attach(io: avatar_1_file, filename: 'avatar_1.jpg', content_type: 'image/jpg')

  company_employee_5.save

  company_employee_10 = User.new(
    first_name: "Jason",
    last_name: "Bourne",
    email: "Jason.Bourne@breadandco.com",
    password: "123456",
    company_id: company.id,
    )
  # company_employee_10.photo.attach(io: avatar_1_file, filename: 'avatar_1.jpg', content_type: 'image/jpg')
  company_employee_10.save

  employee_logistique = User.new(
    first_name: "Gérard",
    last_name: "Transport",
    email: "gerard.transport@logistik.com",
    password: "123456",
    company_id: supplier_logistique.id,
    )
  # employee_logistique.photo.attach(io: avatar_1_file, filename: 'avatar_1.jpg', content_type: 'image/jpg')
  employee_logistique.save

  employee_mineraux = User.new(
    first_name: "Antoine",
    last_name: "Macadam",
    email: "antoine.macadam@Minerals.com",
    password: "123456",
    company_id: supplier_mineraux.id,
    )
  # employee_mineraux.photo.attach(io: avatar_1_file, filename: 'avatar_1.jpg', content_type: 'image/jpg')
  employee_mineraux.save

  employee_IT = User.new(
    first_name: "Jean-Michel",
    last_name: "Haiti",
    email: "jean-michel.haiti@ITandco.com",
    password: "123456",
    company_id: supplier_IT.id,
    )
  # employee_IT.photo.attach(io: avatar_1_file, filename: 'avatar_1.jpg', content_type: 'image/jpg')
  employee_IT.save

  puts 'User done'


# ==============================================================================
# REPORTS
# ==============================================================================

  p "create reports"

  report_1 = Report.new(
    name: "Bread Production",
    year: 2019,
    company_id: company.id,
    user_id: manager.id)
  report_1.photo.attach(io: report_1_file, filename: 'report_1.jpg', content_type: 'image/jpeg')
  report_1.save!
  p report_1

  p report_1.name

  report_2 = Report.new(
    name: "EMEA Support functions",
    year: 2019,
    company_id: company.id,
    user_id: manager.id)
  report_2.photo.attach(io: report_2_file, filename: 'report_2.jpeg', content_type: 'image/jpeg')
  report_2.save!


  p report_2.name

  report_3 = Report.new(
    name: "Global R&D",
    year: 2019,
    company_id: company.id,
    user_id: manager.id)
  report_3.photo.attach(io: report_3_file, filename: 'report_3.jpg', content_type: 'image/jpeg')
  report_3.save!

# ==============================================================================
# EMISSION MODULES
# ==============================================================================


  p "create emission_modules"

  p "scope 1"
  comb_fossiles = EmissionModule.create!(name: "Fossil fuels", scope: 1, photo_url: emission_1_forest)
  # comb_organiques = EmissionModule.create!(name: "Combustibles organiques", scope: 1 )
  changement_affectation_sols = EmissionModule.create!(name: "Change in land use", scope: 1, photo: emission_1_forest)
  deforestation = EmissionModule.create!(name: "Deforestation & reforestation", scope: 1, photo: emission_1_forest)
  refrigeration = EmissionModule.create!(name: "Refrigeration", scope: 1, photo: emission_1_forest)
  clim = EmissionModule.create!(name: "Air conditioning", scope: 1, photo: emission_1_forest)
  agriculture = EmissionModule.create!(name: "Agriculture", scope: 1, photo: emission_1_forest)
  process_industriels = EmissionModule.create!(name: "Industrial processes", scope: 1, photo: emission_1_forest)
  dechets = EmissionModule.create!(name: "Waste", scope: 1, photo: emission_1_forest)



  p "scope 3"
  transport_marchandise_routier = EmissionModule.create!(name: "Road freight", scope: 3)
  transport_marchandise_ferroviaire = EmissionModule.create!(name: "Rail freight", scope: 3)
  transport_marchandise_aerien = EmissionModule.create!(name: "Air freight", scope: 3)
  transport_marchandise_maritime = EmissionModule.create!(name: "Sea freight", scope: 3)
  transport_marchandise_fluvial = EmissionModule.create!(name: "River freight", scope: 3)
  transport_personne_routier = EmissionModule.create!(name: "Road transport", scope: 3)
  transport_personne_ferroviaire = EmissionModule.create!(name: "Rail passenger transport", scope: 3)
  transport_personne_aerien = EmissionModule.create!(name: "Air traffic", scope: 3)
  # transport_personne_maritime = EmissionModule.create!(name: "Transport maritime de personnes", scope: 3)
  transport_personne_fluvial = EmissionModule.create!(name: "River transport", scope: 3)
  achat_produit_agri = EmissionModule.create!(name: "Purchasing - Agricultural products", scope: 3)
  achat_bois_papier_carton = EmissionModule.create!(name: "Purchasing - wood, pulp & paper", scope: 3)
  achat_mineraux = EmissionModule.create!(name: "Purchasing - Minerals & metals", scope: 3)
  achat_machines = EmissionModule.create!(name: "Purchasing - Machines & equipment", scope: 3)
  achat_vehicules = EmissionModule.create!(name: "Purchasing - Vehicles", scope: 3)
  achat_mobiliers = EmissionModule.create!(name: "Purchasing - Furniture", scope: 3)
  achat_textiles = EmissionModule.create!(name: "Purchasing - Textile & clothing", scope: 3)
  consommables = EmissionModule.create!(name: "Office consumables", scope: 3)
  batiment = EmissionModule.create!(name: "Building construction", scope: 3)
  voirie = EmissionModule.create!(name: "Road & public infrastructure construction", scope: 3)
  eau = EmissionModule.create!(name: "Water treatment", scope: 3)
  dechets = EmissionModule.create!(name: "Waste management", scope: 3)

  p "scope 2"
  electricite = EmissionModule.create!(name: "Electricity", scope: 2)
  reseaux_chaleur_froid = EmissionModule.create!(name: "Heating & cooling networks", scope: 2)

  list_of_emission_modules = [comb_fossiles,
    changement_affectation_sols,
    deforestation,
    refrigeration,
    clim,
    agriculture,
    agriculture,
    process_industriels,
    dechets,
    electricite,
    reseaux_chaleur_froid,
    transport_marchandise_routier,
    transport_marchandise_ferroviaire,
    transport_marchandise_aerien,
    transport_marchandise_maritime,
    transport_marchandise_fluvial,
    transport_personne_routier,
    transport_personne_ferroviaire,
    transport_personne_aerien,
    transport_personne_fluvial,
    achat_produit_agri,
    achat_bois_papier_carton,
    achat_mineraux,
    achat_machines,
    achat_vehicules,
    achat_mobiliers,
    achat_textiles,
    consommables,
    batiment,
    voirie,
    eau,
    dechets
  ]

# ==============================================================================
# EMISSION MODULES DESCRIPTION
# ==============================================================================

    # Default values
    list_of_emission_modules.each do |element|
      element.general_description = "This module covers the following category: #{element.name}"
      element.emission_factor_description = "Not specified yet
      element.save"
    end

    desc_elec = "This questionnaire covers all carbon emissions induced by electricity consumption. Sourcing of renewables with green/white certificates can be specified."
    electricite.general_description = desc_elec
    factor_elec = "2019 national average emissions from electricity generation, in kgCO2e/kWh."
    electricite.emission_factor_description = factor_elec
    electricite.save

    desc_comb_fossiles = "This questionnaire covers all carbon fossile combustibles used by your organization."
    comb_fossiles.general_description = desc_comb_fossiles
    factor_comb_fossiles = "Standard emissions from combustion in kgCO2e/l or kgCO2/m3."
    comb_fossiles.emission_factor_description = factor_comb_fossiles
    comb_fossiles.save

# ==============================================================================
# REPORT 1 SCOPES
# ==============================================================================

  # Report 1 : combustibles fossibles, process industriels, refrigeration, dechets,
  # electricité

  p "report 1 scopes: combustibles, process, refrigeration, dechet, electricité"

  report1_scope1 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
  report1_scope1.report_id = report_1.id
  report1_scope1.emission_module_id = comb_fossiles.id
  report1_scope1.save

  report1_scope2 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
  report1_scope2.report_id = report_1.id
  report1_scope2.emission_module_id = achat_produit_agri.id
  report1_scope2.save

  report1_scope3 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
  report1_scope3.report_id = report_1.id
  report1_scope3.emission_module_id = electricite.id
  report1_scope3.save

# ==============================================================================
# REPORT 2 SCOPES
# ==============================================================================

  # Report 2 : clim, electricité

  p "report 2 scopes: electricité, clim"

  report_2_scope1 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
  report_2_scope1.report_id = report_2.id
  report_2_scope1.emission_module_id = electricite.id
  report_2_scope1.save

  report_2_scope2 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
  report_2_scope2.report_id = report_2.id
  report_2_scope2.emission_module_id = clim.id
  report_2_scope2.save


# ==============================================================================
# REPORT 3 SCOPES
# ==============================================================================

  p "report 2 scopes: electricité, clim, process_industriels"

  report_3_scope1 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
  report_3_scope1.report_id = report_3.id
  report_3_scope1.emission_module_id = electricite.id
  report_3_scope1.save

  report_3_scope2 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
  report_3_scope2.report_id = report_3.id
  report_3_scope2.emission_module_id = clim.id
  report_3_scope2.save

  report_3_scope3 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
  report_3_scope3.report_id = report_3.id
  report_3_scope3.emission_module_id = process_industriels.id
  report_3_scope3.save

# ==============================================================================
# REPORT 1 SCOPE ORGAS
# ==============================================================================

  # Report 1 sur le manufacturing et product development

  p "report 1 scope orga (manufacturing et product development)"

  # report1_scope1 => comb fossiles
  # report1_scope2 => achat_produit_agri
  # report1_scope3 => electricite

  # Manufacturing
  # report1_scope1 => comb fossiles
  report1_scope1_orga = ReportScopeOrga.new(
    report_scope_id:report1_scope1.id,
    orga_id: manufacturing.id,
    status: "On-going"
    )
  report1_scope1_orga.save

  # ----------------------------------------------
  # Manufacturing
  # report1_scope2 => achat_produit_agri
  report1_scope2_orga = ReportScopeOrga.new(
    report_scope_id:report1_scope2.id,
    orga_id: manufacturing.id,
    status: "Pending validation"
    )
  report1_scope2_orga.save

  # ----------------------------------------------
  # Manufacturing
  # report1_scope3 => electricite
  report1_scope3_orga = ReportScopeOrga.new(
    report_scope_id:report1_scope3.id,
    orga_id: manufacturing.id,
    status: "On-going"
    )
  report1_scope3_orga.save

  # ----------------------------------------------
  # Product Dev
  # report1_scope2 => achat_produit_agri
  report1_scope4_orga = ReportScopeOrga.new(
    report_scope_id:report1_scope2.id,
    orga_id: product_development.id,
    status: "Pending validation"
    )
  report1_scope4_orga.save

  # ----------------------------------------------
  # Product Dev
  # report1_scope3 => electricite
  report1_scope5_orga = ReportScopeOrga.new(
    report_scope_id:report1_scope3.id,
    orga_id: product_development.id,
    status: "Done"
    )
  report1_scope5_orga.save

    report_scope_array = [
      report1_scope1_orga,
      report1_scope2_orga,
      report1_scope3_orga,
      report1_scope4_orga,
      report1_scope5_orga
   ]


# ==============================================================================
# REPORT 2 SCOPE ORGAS
# ==============================================================================

  # Report 2 sur le RH et Finance

  # report_2_scope1 =>  electricite
  # report_2_scope2 => clim


  p "report 2 scope orga (RH et Finance)"

  report_2_scope1_orga = ReportScopeOrga.new(
    report_scope_id:report_2_scope1.id,
    orga_id: finance.id,
    status: "To start"
    )
  report_2_scope1_orga.save

  # ----------------------------------------------

  report_2_scope2_orga = ReportScopeOrga.new(
    report_scope_id:report_2_scope2.id,
    orga_id: finance.id,
    status: "To start"
    )
  report_2_scope2_orga.save

  # ----------------------------------------------

  report_2_scope3_orga = ReportScopeOrga.new(
    report_scope_id:report_2_scope1.id,
    orga_id: hr.id,
    status: "On-going"
    )
  report_2_scope3_orga.save

  # ----------------------------------------------

  report_2_scope4_orga = ReportScopeOrga.new(
    report_scope_id:report_2_scope2.id,
    orga_id: hr.id,
    status: "On-going"
    )
  report_2_scope4_orga.save

  # ----------------------------------------------

# ==============================================================================
# REPORT 3 SCOPE ORGAS
# ==============================================================================

  p "report 3 scope orga (R&D)"

  # report_3_scope1 >> electricite.id
  # report_3_scope2 >> clim.id
  # report_3_scope3 >> process_industriels.id


  report_3_scope1_orga = ReportScopeOrga.new(
    report_scope_id:report_3_scope1.id,
    orga_id: rd.id,
    status: "To start"
    )
  report_3_scope1_orga.save

  report_3_scope2_orga = ReportScopeOrga.new(
    report_scope_id:report_3_scope2.id,
    orga_id: rd.id,
    status: "To start"
    )
  report_3_scope2_orga.save

  report_3_scope3_orga = ReportScopeOrga.new(
    report_scope_id:report_3_scope3.id,
    orga_id: rd.id,
    status: "To start"
    )
  report_3_scope3_orga.save

# ==============================================================================
# REPORT 1 SCOPE ORGA USERS
# ==============================================================================

  p "Report scope orga users"
  # Profils associes aux 5 périmètres (5 modules dans Manufacturing)
  # 2 users de 2 entreprises pour report1_scope1 : manufacturing - combustibles fossiles

  report1_scope1_orga_user = ReportScopeOrgaUser.new(
    user_id: company_employee_1.id,
    report_scope_orga_id: report1_scope1_orga.id
    )
  report1_scope1_orga_user.save

  # ----------------------------------------------

  report1_scope1_orga_user2 = ReportScopeOrgaUser.new(
    user_id: employee_mineraux.id,
    report_scope_orga_id: report1_scope1_orga.id
    )
  report1_scope1_orga_user2.save

  # ----------------------------------------------

  report1_scope2_orga_user = ReportScopeOrgaUser.new(
    user_id: company_employee_2.id,
    report_scope_orga_id: report1_scope2_orga.id
    )
  report1_scope2_orga_user.save

  # ----------------------------------------------

  report1_scope3_orga_user = ReportScopeOrgaUser.new(
    user_id: company_employee_3.id,
    report_scope_orga_id: report1_scope3_orga.id
    )
  report1_scope3_orga_user.save

  # ----------------------------------------------

  report1_scope4_orga_user = ReportScopeOrgaUser.new(
    user_id: company_employee_4.id,
    report_scope_orga_id: report1_scope4_orga.id
    )
  report1_scope4_orga_user.save

  # ----------------------------------------------

  report1_scope5_orga_user = ReportScopeOrgaUser.new(
    user_id: company_employee_5.id,
    report_scope_orga_id: report1_scope5_orga.id
    )
  report1_scope5_orga_user.save

# ==============================================================================
# QUESTIONS & ANSWER - Modules for graph only (dummy data)
# ==============================================================================

  # TO DO - variabiliser ademe_emission_factor_id

  # p "creation des Q&A pour les modules utilisés dans l'exemple 'Manufacturing'"

  # emission_modules_used_in_report1 = [process_industriels]

  # p "array emission_modules_used_in_report1"
  # p emission_modules_used_in_report1

  # emission_modules_used_in_report1.each_with_index { |emission_module, i|
  #   p "emission_module"
  #   p emission_module.name

  #   counter_question = 0
  #   5.times do
  #     counter_question += 1
  #     question = Question.new(
  #       calculation: true,
  #       content: "Question number #{i}. To be detailed",
  #       ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 1330 }.id,
  #       emission_module_id: emission_module.id)
  #     question.save
  #     answer = Answer.new(
  #       calculation: true,
  #       question_id: question.id,
  #       report_scope_orga_id: report_scope_array[i].id,
  #       content: counter_question * 100)
  #     answer.save
  #   end
  # }

# ==============================================================================
# QUESTIONS - Electricity
# ==============================================================================

  # Electricité - questions
  question_elec_1 = Question.create!(
    calculation: false,
    content: "Please indicate the country for the electricity consumption",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 1088 }.id,
    emission_module_id: electricite.id)

  question_elec_2 = Question.create!(
    calculation: true,
    content: "What is the total annual electricity consumption in kWh?",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 1088 }.id,
    emission_module_id: electricite.id)

  question_elec_2 = Question.create!(
    calculation: false,
    content: "What is the share of this consumption that is purchased with green certificates (i.e. guaranteed renewable production)",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 1088 }.id,
    emission_module_id: electricite.id)

# ==============================================================================
# ANSWER REPORT 1 - Electricity
# ==============================================================================

  # Electricité answers

  # Question 1
    # Electricity x manufacturing
    answer_elect_1_manuf = Answer.create!(
        calculation: false,
        question_id: question_elec_1.id,
        report_scope_orga_id: report1_scope3_orga.id,
        unit: "",
        content: "France")

    # Electricity x product development
    answer_elect_1_productdev = Answer.create!(
        calculation: false,
        question_id: question_elec_1.id,
        report_scope_orga_id: report1_scope5_orga.id,
        unit: "",
        content: "France")

  # Question 2
    # Electricity x manufacturing
    answer_elect_2_manuf = Answer.create!(
        calculation: true,
        question_id: question_elec_1.id,
        report_scope_orga_id: report1_scope3_orga.id,
        unit: "kWh",
        content: 45000)

    # Electricity x product development
    answer_elect_2_productdev = Answer.create!(
        calculation: true,
        question_id: question_elec_1.id,
        report_scope_orga_id: report1_scope5_orga.id,
        unit: "kWh",
        content: 12000)

  # Question 3
    # Electricity x manufacturing
    answer_elect_3_manuf = Answer.create!(
        calculation: false,
        question_id: question_elec_1.id,
        report_scope_orga_id: report1_scope3_orga.id,
        unit: "%",
        content: "0")

    # Electricity x product development
    answer_elect_3_productdev = Answer.create!(
        calculation: false,
        question_id: question_elec_1.id,
        report_scope_orga_id: report1_scope5_orga.id,
        unit: "%",
        content: "0")

# ==============================================================================
# QUESTIONS - COMBUSTIBLES FOSSILES
# ==============================================================================

  # Combustibles fossibles - questions
  question_comb_fossiles_1 = Question.create!(
    calculation: true,
    content: "What is your annual natural gas consumption in m3? ",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 1221 }.id,
    emission_module_id: comb_fossiles.id)

  question_comb_fossiles_2 = Question.create!(
    calculation: true,
    content: "What is your annual propane consumption in liters?",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 4484 }.id,
    emission_module_id: comb_fossiles.id)

  question_comb_fossiles_3 = Question.create!(
    calculation: true,
    content: "What is your annual heavy fuel oil consumption in liters?",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 1165 }.id,
    emission_module_id: comb_fossiles.id)

  question_comb_fossiles_4 = Question.create!(
    calculation: true,
    content: "What is your annual butane consumption in liters?",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 4494 }.id,
    emission_module_id: comb_fossiles.id)

  question_comb_fossiles_5 = Question.create!(
    calculation: true,
    content: "What is your annual petrol (95, 95-E10, 98) consumption in liters?",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 1145 }.id,
    emission_module_id: comb_fossiles.id)

  question_comb_fossiles_6 = Question.create!(
    calculation: true,
    content: "What is your annual petrol (E85) consumption in liters?",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 1489 }.id,
    emission_module_id: comb_fossiles.id)

  question_comb_fossiles_7 = Question.create!(
    calculation: true,
    content: "What is your annual gasoil consumption in liters?",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 1161 }.id,
    emission_module_id: comb_fossiles.id)


  # Combustibles fossiles - answers

  #  combustibles fossiles x manufacturing
    answer_comb_fossiles_1_manuf = Answer.create!(
        calculation: true,
        question_id: question_comb_fossiles_1.id,
        report_scope_orga_id: report1_scope1_orga.id,
        unit: "cubic meters",
        content: 10000)

    answer_comb_fossiles_2_manuf = Answer.create!(
        calculation: true,
        question_id: question_comb_fossiles_2.id,
        report_scope_orga_id: report1_scope1_orga.id,
        unit: "liters",
        content: 20000)

    answer_comb_fossiles_3_manuf = Answer.create!(
        calculation: true,
        question_id: question_comb_fossiles_3.id,
        report_scope_orga_id: report1_scope1_orga.id,
        unit: "liters",
        content: 10000)

    answer_comb_fossiles_4_manuf = Answer.create!(
        calculation: true,
        question_id: question_comb_fossiles_4.id,
        report_scope_orga_id: report1_scope1_orga.id,
        unit: "liters",
        content: 20000)

    answer_comb_fossiles_5_manuf = Answer.create!(
        calculation: true,
        question_id: question_comb_fossiles_5.id,
        report_scope_orga_id: report1_scope1_orga.id,
        unit: "liters",
        content: 1000)

    answer_comb_fossiles_6_manuf = Answer.create!(
        calculation: true,
        question_id: question_comb_fossiles_6.id,
        report_scope_orga_id: report1_scope1_orga.id,
        unit: "liters",
        content: 1500)

    answer_comb_fossiles_7_manuf = Answer.create!(
        calculation: true,
        question_id: question_comb_fossiles_7.id,
        report_scope_orga_id: report1_scope1_orga.id,
        unit: "liters",
        content: 5000)

# ==============================================================================
# Q&A - ACHAT PRODUITS AGRICOLES
# ==============================================================================

  # achat_produit_agri - questions

  question_achat_produit_agri_1 = Question.create!(
    calculation: true,
    content: "What is the quantity purchased of soft wheat? (in kg)",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 1400 }.id,
    emission_module_id: achat_produit_agri.id)

  question_achat_produit_agri_2 = Question.create!(
    calculation: true,
    content: "What is the quantity purchased of durum wheat? (in kg)",
    ademe_emission_factor_id: AdemeEmissionFactor.find{ |item| item.count == 1405 }.id,
    emission_module_id: achat_produit_agri.id)

  # achat_produit_agri - answers

  # achats pour manufacturing

    answer_comb_fossiles_1_manuf = Answer.create!(
        calculation: true,
        question_id: question_achat_produit_agri_1.id,
        report_scope_orga_id: report1_scope2_orga.id,
        unit: "kg",
        content: 50000)

    answer_achat_produit_agri_2_manuf = Answer.create!(
        calculation: true,
        question_id: question_achat_produit_agri_2.id,
        report_scope_orga_id: report1_scope2_orga.id,
        unit: "kg",
        content: 30000)

    # achats pour product development

    answer_comb_fossiles_1_manuf = Answer.create!(
        calculation: true,
        question_id: question_achat_produit_agri_1.id,
        report_scope_orga_id: report1_scope4_orga.id,
        unit: "kg",
        content: 5000)

    answer_achat_produit_agri_2_manuf = Answer.create!(
        calculation: true,
        question_id: question_achat_produit_agri_2.id,
        report_scope_orga_id: report1_scope4_orga.id,
        unit: "kg",
        content: 3000)

# ==============================================================================
# TESTORGA
# ==============================================================================

  my_company = Testorga.create!(
    name: "Company")
  amer = Testorga.create!(
    name: "AMER",
    parent_id: 0)
  apac = Testorga.create!(
    name: "APAC",
    parent_id: 0)
  emea = Testorga.create!(
    name: "EMEA",
    parent_id: 0)
  manufacturing_amer = Testorga.create!(
    name: "Manufacturing",
    parent_id: 1
    )
  manufacturing_apac = Testorga.create!(
    name: "Manufacturing",
    parent_id: 2
    )
  manufacturing_emea = Testorga.create!(
    name: "Manufacturing",
    parent_id: 3
    )
