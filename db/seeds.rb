# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO:
#  - skills
# - 2 employers
# - 3 jobs
# - 5 developers

puts "Cleaning database..."

Employer.destroy_all
Job.destroy_all
User.destroy_all
Skill.destroy_all

########################################
#
# SKILLS
#
# ########################################

puts "Creating skills..."

skill_names = ["ruby", "ruby on rails", "back-end", "front-end", "SQL", "CSS", "javascript", "HTML"]

skill_names.each do |name|
  Skill.create!(name: name)
end

########################################
#
# EMPLOYERS
#
# ########################################

puts "Creating employers..."

lewagon = Employer.create!(
  company_name: "Le wagon",
  first_name: "Anne",
  last_name: "Collet",
  email: "anne@lewagon.org",
  street: "rijswijkstraat 49",
  postcode: "1062ep",
  city: "Amsterdam",
  country: "Nederlands",
  phone: "+319485748439",
  password: "lewagon",
  password_confirmation: "lewagon"
)

springest = Employer.create!(
  company_name: "Springest",
  first_name: "Ruben",
  last_name: "Timmerman",
  email: "contact@springest.com",
  street: "rokin 92",
  postcode: "10642ep",
  city: "Amsterdam",
  country: "Nederlands",
  phone: "+319485748439",
  password: "lewagon",
  password_confirmation: "lewagon"
)

########################################
#
# JOBS
#
# ########################################

puts "Creating jobs..."

rails_coach = lewagon.jobs.create!(
  job_title: "Ruby on Rails Coach",
  salary: 50000,
  description: "Should be creative and like to teach",
  location: "Amsterdam"
)

rails_coach.job_skills.create!(skill: Skill.find_by_name("ruby"))
rails_coach.job_skills.create!(skill: Skill.find_by_name("back-end"))
rails_coach.job_skills.create!(skill: Skill.find_by_name("ruby on rails"))

frontend_coach = lewagon.jobs.create!(
  job_title: "Front-end Coach",
  salary: 25000,
  description: "Should be creative, creative and creative!",
  location: "Amsterdam"
)

frontend_coach.job_skills.create!(skill: Skill.find_by_name("HTML"))
frontend_coach.job_skills.create!(skill: Skill.find_by_name("CSS"))
frontend_coach.job_skills.create!(skill: Skill.find_by_name("javascript"))

backend_dev = springest.jobs.create!(
  job_title: "Back-end Ruby on Rails developer",
  salary: 50000,
  description: "Should be creative and have 5 years of experience",
  location: "Amsterdam"
)

backend_dev.job_skills.create!(skill: Skill.find_by_name("ruby"))
backend_dev.job_skills.create!(skill: Skill.find_by_name("back-end"))
backend_dev.job_skills.create!(skill: Skill.find_by_name("ruby on rails"))

########################################
#
# DEVELOPERS
#
# ########################################

puts "Creating developers..."

titles = ["dev", "consultant", "hacker", "unicorn", "ninja"]

# Umer

umer = User.create!(
  email: "umersaqib160@hotmail.com",
  job_title: "#{Faker::Company.profession} #{titles.sample}",
  first_name: "Umer",
  last_name: "Saqib",
  birth_date: Faker::Date.between(42.years.ago, 20.years.ago),
  street: "Nassaukade 307",
  city: "Amsterdam",
  password: "lewagon",
  password_confirmation: "lewagon"
)

umer.create_resume!(
  phone: Faker::PhoneNumber.phone_number,
  summary: "An enthusiast to learn, adapt to change and excel in all the opportunities provided. Carrying great communication, entrepreneurial, innovative and creative skills.",
  linkedin: "https://www.linkedin.com/in/umer-saqib-96788486",
  years_of_experience: 3,
  photo: File.open(Rails.root.join("db/seeds/images/umer.jpg"))
)

# Samy

samy = User.create!(
  email: Faker::Internet.email,
  job_title: "#{Faker::Company.profession} #{titles.sample}",
  first_name: "Samy",
  last_name: "Amar",
  birth_date: Faker::Date.between(42.years.ago, 20.years.ago),
  street: "Nassaukade 307",
  city: "Amsterdam",
  password: "lewagon",
  password_confirmation: "lewagon"
)

samy.create_resume!(
  phone: Faker::PhoneNumber.phone_number,
  summary: "Like to code and cook at skello. Alumni from batch 18 of Le Wagon Paris.",
  linkedin: "https://www.linkedin.com/in/samy-amar-02a181a4",
  years_of_experience: 2,
  photo: File.open(Rails.root.join("db/seeds/images/samy.jpg"))
)

# Mike

mike = User.create!(
  email: Faker::Internet.email,
  job_title: "#{Faker::Company.profession} #{titles.sample}",
  first_name: "Mike",
  last_name: "Hanot",
  birth_date: Faker::Date.between(42.years.ago, 20.years.ago),
  street: "Nassaukade 307",
  city: "Amsterdam",
  password: "lewagon",
  password_confirmation: "lewagon"
)

mike.create_resume!(
  phone: Faker::PhoneNumber.phone_number,
  summary: "Young and ambitious, two of my main assets are my analytical skills and my communication skills. After having worked 4 years as SME's Manager, I looked for a new challenge. I'm currently working for Bisnode Belgium, European leader in direct and data marketing.",
  linkedin: "https://www.linkedin.com/in/michaelhanot",
  years_of_experience: 2,
  photo: File.open(Rails.root.join("db/seeds/images/mike.jpg"))
)

# Vallentino

vallentino = User.create!(
  email: Faker::Internet.email,
  job_title: "#{Faker::Company.profession} #{titles.sample}",
  first_name: "Vallentino",
  last_name: "Sakidin",
  birth_date: Faker::Date.between(42.years.ago, 20.years.ago),
  street: "Nassaukade 307",
  city: "Amsterdam",
  password: "lewagon",
  password_confirmation: "lewagon"
)

vallentino.create_resume!(
  phone: Faker::PhoneNumber.phone_number,
  summary: "Structured / Accurate / Responsible / Communicative / Team player / Able to see the big picture
Project Management / IT Architectures / Cloud Computing / Enterprise Resource Planning",
  linkedin: "https://www.linkedin.com/in/vallentino",
  years_of_experience: 1,
  photo: File.open(Rails.root.join("db/seeds/images/vallentino.jpg"))
)

# Elyas

elyas = User.create!(
  email: Faker::Internet.email,
  job_title: "#{Faker::Company.profession} #{titles.sample}",
  first_name: "Elyas",
  last_name: "Boumejjane",
  birth_date: Faker::Date.between(42.years.ago, 20.years.ago),
  street: "Nassaukade 307",
  city: "Amsterdam",
  password: "lewagon",
  password_confirmation: "lewagon"
)

elyas.create_resume!(
  phone: Faker::PhoneNumber.phone_number,
  summary: "Rubyist in training",
  linkedin: "https://www.linkedin.com/in/elyas-boumejjane-47b2b476",
  years_of_experience: 2,
  photo: File.open(Rails.root.join("db/seeds/images/elyas.jpg"))
)

########################################
#
# WORK EXPREIENCES / EDUCATIONS / PROJECTS / SKILLS
#
# ########################################

puts "Creating work experiences / educations / projects / skills..."

User.all.each do |user|
  # WORK EXPERIENCES
  (1..3).to_a.sample.times do |index|
    date = Date.today - index.years
    description = "Responsible of #{Faker::Company.profession} #{titles.sample} team"

    user.resume.work_experiences.create!(
      start_date: date,
      end_date: (date + 1.year),
      company_name: Faker::Company.name,
      job_title: "#{Faker::Company.profession} #{titles.sample}",
      description: description
    )
  end

  # EDUCATIONS
  (1..3).to_a.sample.times do |index|
    date = Date.today - index.years

    user.resume.educations.create!(
      name: "#{Faker::Company.profession} #{titles.sample}",
      school: Faker::University.name,
      start_date: date,
      end_date: (date + 1.year),
    )
  end

  # PROJECTS
  (1..3).to_a.sample.times do |index|
    user.resume.projects.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Company.catch_phrase
    )
  end

  # SKILLS
  (1..8).to_a.sample.times do |index|
    user.resume.resume_skills.create!(
      skill: Skill.find_by_name(skill_names[index])
    )
  end
end
