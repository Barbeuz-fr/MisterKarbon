# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "reset seed database"
User.destroy_all

# ==============================================================================
# USERS
# ==============================================================================

# TO DO : REMOVE when SEED company updated
 strawberry = Company.create!(name: "Strawberry")

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
    company_id: strawberry.id
    )
    user.save!
end

puts 'USER DONE!'
