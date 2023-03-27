class Account < ApplicationRecord
  attr_writer :login
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :questions, dependent: :destroy
  has_many :replies, dependent: :destroy
  
  validates_presence_of :username
  validates_uniqueness_of :username
  validates :username, length: { minimum: 3, maximum: 25 }
  
  validates_format_of :username, with: /^[a-zA-Z0-9_]*$/, :multiline => true
  

  # Allows login with username or email
  def login
    @login || self.username || self.email
  end
  
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
