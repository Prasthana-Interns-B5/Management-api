class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :lockable, :timeoutable, :trackable
  has_many :user_logins
end
