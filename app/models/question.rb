class Question < ApplicationRecord
  belongs_to :employee
  has_many :answers, dependent: :destroy
end
