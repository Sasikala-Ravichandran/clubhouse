class Member < ActiveRecord::Base

  attr_accessor :remember_token
  has_many :posts
  has_secure_password
  validates :name, presence: true, 
                    length: { minimum: 2, maximum: 10 }, 
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  def Member.generate_token
    SecureRandom.urlsafe_base64
  end

  def Member.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def remember
    self.remember_token = Member.generate_token
    update_attribute(:remember_digest, Member.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

end