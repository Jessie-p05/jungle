class User < ActiveRecord::Base 
  has_secure_password

  validates :email, :uniqueness => { :case_sensitive => false }, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true,length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }

  def self.authenticate_with_credentials(email,password)
    user = User.find_by("LOWER(email)= ?",email.strip.downcase)
   if user && user.authenticate(password)
    user
   else
    nil
   end
    
  end
end