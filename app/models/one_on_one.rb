# frozen_string_literal: true

class OneOnOne < ApplicationRecord
  accepts_nested_attributes_for :reviews
  attr_accessor :employee_attributes
end
