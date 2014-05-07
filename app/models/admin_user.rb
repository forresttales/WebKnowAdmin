# == Schema Information
#
# Table name: admin_users
#
#  id              :integer          not null, primary key
#  name_first      :string(255)
#  name_last       :string(255)
#  username        :string(255)
#  email           :string(255)
#  password        :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  hashed_password :string(255)
#  salt            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class AdminUser < ActiveRecord::Base
  
  attr_accessible :id, 
                  :name_first, 
                  :name_last, 
                  :email, 
                  :username, 
                  :password, 
                  :password_confirmation, 
                  :created_at, 
                  :updated_at


  has_many :admin_user_images
  
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 4 }
    
  
      
    
    def AdminUser.new_remember_token
      SecureRandom.urlsafe_base64
    end
  
    def AdminUser.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
    
    def self.dbdelete
        self.connection.execute("DELETE FROM admin_users")
    end
    
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE admin_users_id_seq RESTART WITH 1")
    end
    
    
        
    # def feed
      # Micropost.from_users_followed_by(self)
    # end
#   
    # def following?(other_user)
      # relationships.find_by(followed_id: other_user.id)
    # end
#   
    # def follow!(other_user)
      # relationships.create!(followed_id: other_user.id)
    # end
#   
    # def unfollow!(other_user)
      # relationships.find_by(followed_id: other_user.id).destroy!
    # end
  
    private
  
      def create_remember_token
        self.remember_token = AdminUser.encrypt(AdminUser.new_remember_token)
      end


  
end
