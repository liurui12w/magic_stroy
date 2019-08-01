class User < ApplicationRecord

  acts_as_token_authenticatable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :schedules

  def reset_authentication_token!
    update authentication_token: Devise.token_generator.generate(User, :authentication_token).first
  end

  def email_required?
   false
  end

  def email_changed?
   false
  end


end
