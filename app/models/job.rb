class Job < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search,
    against: [:job_title],
    associated_against: {
      skills: [:name]
    }

  belongs_to :employer

  has_many :applications,  dependent: :destroy
  has_many :job_skills, dependent: :destroy
  has_many :skills, through: :job_skills

  accepts_nested_attributes_for :skills
end
