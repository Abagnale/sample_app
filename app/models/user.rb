# == Schema Information
# Schema version: <timestamp>
#
# Table nom: users
#
#  id         :integer         not null, primary key
#  nom       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#
require 'digest'

class User < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :nom, :email, :password, :password_confirmation

	has_many :microposts, :dependent => :destroy

	# Cree automatique l'attribut virtuel 'password_confirmation'.
	validates :password, :presence		=> true,
						:confirmation	=> true,
						:length			=> { :within => 6..40 }
  
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
	validates :nom, 	:presence 	=> true,
						:length 	=> { :maximum => 50 }
						
	validates :email,	:presence 	=> true,
						:length 	=> { :maximum => 100 },
						:format 	=> { :with => email_regex },
						:uniqueness => { :case_sensitive => false }

  
  
  
  # Retour true (vrai) si le mot de passe correspond.
  def has_password?(password_soumis)
	encrypted_password == encrypt(password_soumis)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def feed
    Micropost.where("user_id = ?", id)
  end
  
  before_save :encrypt_password
  
  private
  
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
    
  
  
end
