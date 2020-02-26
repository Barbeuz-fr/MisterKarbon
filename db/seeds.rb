# TO DO
require "open-uri"
# ajout du scope détaillé pour un exemple de projet
# chargement du csv ADEME formatté
# ajout des questions pour 1 module electricité et 1 module transport
# ajout des réponses pour un exemple de projet
# ajout photo pour users

# ==============================================================================
# RESET SEED
# ==============================================================================

  p "reset database"

  ReportScopeOrgaUser.destroy_all
  ReportScopeOrga.destroy_all
  Orga.destroy_all
  Answer.destroy_all
  Question.destroy_all
  AdemeEmissionFactor.destroy_all
  ReportScope.destroy_all
  Report.destroy_all
  User.destroy_all
  Company.destroy_all
  EmissionModule.destroy_all

# ==============================================================================
# IMAGES REPORTS
# ==============================================================================

  p "save images report"
  report_1_file = URI.open('https://cdn.pixabay.com/photo/2015/04/23/22/01/tree-736887_1280.jpg')
  report_2_file = URI.open('https://cdn.pixabay.com/photo/2013/10/09/02/26/coast-192979_1280.jpg')

# --------------------------------------------------------------------------------------
# IMPORTATION CSV ADEME
# ==============================================================================

  p "starting csv import ADEME"
  require 'csv'

  csv_text = File.read(Rails.root.join('lib', 'seeds', 'base_carbone_ademe_csv.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  csv.each do |row|
    t = AdemeEmissionFactor.new()
    t.name = row['Code de la catégorie']
    t.emission_value = row['Total poste non décomposé']
    t.unit = row['Unité français']
    t.save
  end

  p "import done"

  p "last line ADEME emission factor"
  p AdemeEmissionFactor.last

  p "count ADEME line"
  AdemeEmissionFactor.count

# ==============================================================================
# COMPANY
# ==============================================================================

  p "create company"

  company = Company.create!(name: "Strawberry")

  p company.name

  supplier_logistique = Company.create!(name: "Norbert Transport")

  p supplier_logistique.name

  supplier_mineraux = Company.create!(name: "Aremis")

  p supplier_mineraux.name

  supplier_IT = Company.create!(name: "IT & co")

  p supplier_IT.name

# ==============================================================================
# USERS
# ==============================================================================
  p "Create users"

  puts 'Creating 10 fake users...'

  manager = User.new(
    first_name: "JC",
    email: "test@gmail.com",
    password: 123456,
    last_name: "Bertrand",
    company_id: company.id
    )
  manager.save
  p manager
  p manager.first_name

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
      p user.first_name
  end

  company_employee_1 = User.new(
    first_name: "Germain",
    last_name: "Dubreuil",
    email: "germain.dubreuil@strawberry.com",
    password: "123456",
    company_id: company.id
    )
  company_employee_1.save

  company_employee_2 = User.new(
    first_name: "Antoine",
    last_name: "Fraveaux",
    email: "Antoine.Fraveaux@strawberry.com",
    password: "123456",
    company_id: company.id
    )
  company_employee_2.save

  company_employee_3 = User.new(
    first_name: "Jeremy",
    last_name: "Kerviel",
    email: "Jeremy.Kerviel@strawberry.com",
    password: "123456",
    company_id: company.id
    )
  company_employee_3.save

  company_employee_3 = User.new(
    first_name: "Jason",
    last_name: "Bourne",
    email: "Jason.Bourne@strawberry.com",
    password: "123456",
    company_id: company.id
    )
  company_employee_3.save

  company_employee_4 = User.new(
    first_name: "Greta",
    last_name: "Garbo",
    email: "Greta.Garbo@strawberry.com",
    password: "123456",
    company_id: company.id
    )
  company_employee_4.save

  company_employee_5 = User.new(
    first_name: "Jason",
    last_name: "Statham",
    email: "Jason.Statham@strawberry.com",
    password: "123456",
    company_id: company.id
    )
  company_employee_5.save

  employee_logistique = User.new(
    first_name: "Gérard",
    last_name: "Transport",
    email: "gerard.transport@logistik.com",
    password: "123456",
    company_id: supplier_logistique.id
    )
  employee_logistique.save

  employee_mineraux = User.new(
    first_name: "Antoine",
    last_name: "Macadam",
    email: "antoine.macadam@Minerals.com",
    password: "123456",
    company_id: supplier_mineraux.id
    )
  employee_mineraux.save

  employee_IT = User.new(
    first_name: "Jean-Michel",
    last_name: "Haiti",
    email: "jean-michel.haiti@ITandco.com",
    password: "123456",
    company_id: supplier_IT.id
    )
  employee_IT.save

  puts 'User done'

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

  hr = Orga.new(name: "HR")
  hr.company = company
  hr.save

# ==============================================================================
# REPORTS
# ==============================================================================

  p "create reports"

  report_1 = Report.new(
    name: "Manufacturing",
    year: 2019,
    company_id: company.id,
    user_id: manager.id)
  report_1.photo.attach(io: report_1_file, filename: 'report_1.jpg', content_type: 'image/jpg')
  report_1.save!
  p report_1

  p report_1.name

  report_2 = Report.new(
    name: "Product Development",
    year: 2019,
    company_id: company.id,
    user_id: manager.id)
  report_2.photo.attach(io: report_2_file, filename: 'report_2.jpg', content_type: 'image/jpg')
  report_2.save!

  p report_2

  p report_2.name

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
    deadline: DateTime.new(2020,6,1))
  report1_scope1.report_id = report_1.id
  report1_scope1.emission_module_id = comb_fossiles.id
  report1_scope1.save

  report1_scope2 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
  report1_scope2.report_id = report_1.id
  report1_scope2.emission_module_id = process_industriels.id
  report1_scope2.save

  report1_scope3 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
  report1_scope3.report_id = report_1.id
  report1_scope3.emission_module_id = refrigeration.id
  report1_scope3.save

  report1_scope4 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
  report1_scope4.report_id = report_1.id
  report1_scope4.emission_module_id = dechets.id
  report1_scope4.save

  report1_scope5 = ReportScope.new(
    deadline: DateTime.new(2020,6,1))
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
    orga_id: manufacturing.id,
    status: "To send"
    )
  report1_scope1_orga.save

  # ----------------------------------------------

  report1_scope2_orga = ReportScopeOrga.new(
    report_scope_id:report1_scope2.id,
    orga_id: manufacturing.id,
    status: "To send"
    )
  report1_scope2_orga.save

  # ----------------------------------------------

  report1_scope3_orga = ReportScopeOrga.new(
    report_scope_id:report1_scope3.id,
    orga_id: manufacturing.id,
    status: "To send"
    )
  report1_scope3_orga.save

  # ----------------------------------------------

  report1_scope4_orga = ReportScopeOrga.new(
    report_scope_id:report1_scope4.id,
    orga_id: manufacturing.id,
    status: "To send"
    )
  report1_scope4_orga.save

  # ----------------------------------------------

  report1_scope5_orga = ReportScopeOrga.new(
    report_scope_id:report1_scope5.id,
    orga_id: manufacturing.id,
    status: "To send"
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
# REPORT1 SCOPE ORGA USERS
# ==============================================================================

  p "Report scope orga users"
  # Profils associes aux 5 périmètres (5 modules dans Manufacturing)
  # 2 users de 2 entreprises pour report1_scope1 : manufacturing - combustibles fossiles

  report1_scope1_orga_user = ReportScopeOrgaUser.new(
    user_id: company_employee_1.id,
    report_scope_orga_id: report1_scope1_orga.id
    )
  report1_scope1_orga_user.save

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
# QUESTIONS - Modules for preview (must be meaningful ;) ) DO TO
# ==============================================================================

  p "creation des questions pour les modules en preview"

  question_list = ["1) How many tonnes x km have been transported on large trucks?",
                  "2) How many tonnes x km have been transported on small trucks?"
                ]

  question_list.each_with_index { |question, i|
      q = Question.new(
        calculation: true,
        content: question,
        emission_module_id: transport_marchandise_routier.id,
        ademe_emission_factor_id: i)
      q.save
  }

# ==============================================================================
# QUESTIONS & ANSWER - Modules for graph only (data can be dummy)
# ==============================================================================

  # TO DO - variabiliser ademe_emission_factor_id

  p "creation des Q&A pour les modules utilisés dans l'exemple 'Manufacturing'"

  emission_modules_used_in_report1 = [comb_fossiles,
                              process_industriels,
                              refrigeration,
                              dechets,
                              electricite]

  p "array emission_modules_used_in_report1"
  p emission_modules_used_in_report1

  emission_modules_used_in_report1.each_with_index { |emission_module, i|
    p "emission_module"
    p emission_module.name

    5.times do
      question = Question.new(
        calculation: true,
        content: "#{i}. Some question",
        ademe_emission_factor_id: AdemeEmissionFactor.first.id,
        emission_module_id: emission_module.id)
      question.save
      answer = Answer.new(
        calculation: true,
        question_id: question.id,
        report_scope_orga_id: report_scope_array[i].id,
        content: 1)
      answer.save
    end
  }



