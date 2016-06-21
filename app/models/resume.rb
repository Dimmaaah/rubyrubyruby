class Resume < ActiveRecord::Base
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  has_many :resume_skills, dependent: :destroy
  has_many :skills, through: :resume_skills

  has_many :educations, dependent: :destroy
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true

  # TODO: projects and work experiences
end
