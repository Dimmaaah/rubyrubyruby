class User < ActiveRecord::Base

  has_one :identity, dependent: :destroy
  has_one :resume, dependent: :destroy

  has_many :applications, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #
  validates :birth_date, inclusion: { in: (Date.new(1900, 1, 1)..(Date.today - 16.years)), allow_nil:false }, on: :update

  accepts_nested_attributes_for :resume, reject_if: :all_blank, allow_destroy: true

  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:linkedin]

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

 def self.find_for_oauth(auth, signed_in_resource = nil)

   # Get the identity and user if they exist
   identity = Identity.find_for_oauth(auth)

   user = signed_in_resource ? signed_in_resource : identity.user

   # Create the user if needed
   if user.nil?

     # Get the existing user by email if the provider gives us a verified email.
     # If no verified email was provided we assign a temporary email and ask the  r
     # user to verify it on the next step via UsersController.finish_signup
     email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
     email = auth.info.email if email_is_verified
     user = User.where(:email => email).first if email

     # Create the user if it's a new registration
     if user.nil?
       user = User.new(
         #username: auth.info.nickname || auth.uid,
         email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
         password: Devise.friendly_token[0,20]
       )
       user.save!
     end
   end

   # Associate the identity with the user if needed
   if identity.user != user
     identity.user = user
     identity.save!
   end
   user
 end

 def email_verified?
   self.email && self.email !~ TEMP_EMAIL_REGEX
 end
end
