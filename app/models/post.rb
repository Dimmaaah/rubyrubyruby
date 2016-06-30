class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :employer

  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true
end
