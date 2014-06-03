class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def update_stripe
    return if email.include?(ENV['ADMIN_EMAIL'])
    return if email.include?('@example.com') and not Rails.env.production?
  end  
end
