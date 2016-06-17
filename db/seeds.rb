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
#

Employer.destroy_all
Job.destroy_all
User.destroy_all
Skill.destroy_all

########################################
#
# SKILLS
#
# ########################################

["ruby", "ruby on rails", "back-end", "front-end", "SQL", "CSS", "javascript", "HTML"].each do |name|
  Skill.create!(name: name)
end

########################################
#
# EMPLOYERS
#
# ########################################

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

titles = ["dev", "consultant", "hacker", "unicorn", "ninja"]

5.times do
  job_title = "#{Faker::Company.profession} #{titles.sample}"

  user = User.create!(
    email: Faker::Internet.email,
    job_title: job_title,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.between(42.years.ago, 20.years.ago),
    street: "Nassaukade 307",
    city: "Amsterdam",
    password: "lewagon",
    password_confirmation: "lewagon"
  )
  user.create_resume!
end
