class User < ActiveRecord::Base
    before_create :confirmation_token
  
    has_many :appointments
    has_many :rentals
    validates :username, presence: true
    validates :UIN, presence: true, uniqueness: true, length:{minimum: 9, maximum: 9}
    validates :phone, presence: true, uniqueness: true, 
              length:{minimum: 10, maximum: 10}
    VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
              length: {maximum: 105},
              uniqueness: true,
              format: { with: VALID_EMAIL_REGEX}
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true, length: { minimum: 6 }

    has_secure_password
    def email_activate
      self.email_confirmed = true
      self.confirm_token = nil
      save!(:validate => false)
    end
    
    private
    def confirmation_token
      if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
=begin  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
=end
end