# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :one_on_one
  has_many :comments
  accepts_nested_attributes_for :comments
end
