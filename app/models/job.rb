class Job < ActiveRecord::Base
  belongs_to :employer

  has_many :applications,  dependent: :destroy
  has_many :job_skills, dependent: :destroy
  has_many :skills, through: :job_skills

  accepts_nested_attributes_for :skills
end
