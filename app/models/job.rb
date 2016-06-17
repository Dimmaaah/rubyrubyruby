class Job < ActiveRecord::Base
  belongs_to :employer

  has_many :job_skills, dependent: :destroy
  has_many :skills, through: :job_skills
end
