# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ==============================================================================
# USERS
# ==============================================================================

puts 'Creating 100 fake users...'
100.times do
  # remplacer puts par User.new
    puts "
    first_name:    #{Faker::Name.first_name},
    last_name: #{Faker::Name.last_name},
    Email: #{Faker::Name.first_name}.#{Faker::Name.first_name}@gmail.com,
    address: #{Faker::Address.street_address}, #{Faker::Address.city},
    job: #{Faker::Job.title},
    position: #{Faker::Job.position}
    "
    # ADD company_id
end
# pour Faker::Job.title faire .sample avec les positions qui nous interesse
# Faker::Job.title #=> "Lead Accounting Associate"
# Faker::Job.field #=> "Manufacturing"
# Faker::Job.seniority #=> "Lead"
# Faker::Job.position #=> "Supervisor"
# Faker::Job.key_skill #=> "Teamwork"
# Faker::Job.employment_type #=> "Full-time"
# Faker::Job.education_level #=> "Bachelor"


puts 'USER DONE!'
