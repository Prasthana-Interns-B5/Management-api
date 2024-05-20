# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    email { 'radhika@gmail.com' }
    password { 'Radhika@123' }
    name { 'Radhika' }
  end
end
