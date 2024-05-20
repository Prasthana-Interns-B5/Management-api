class OneOnOne < ApplicationRecord
  has_many :reviews
  accepts_nested_attributes_for :reviews
  attr_accessor :employee_attributes
end
