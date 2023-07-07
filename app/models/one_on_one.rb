class OneOnOne < ApplicationRecord
    has_many :employee_roles
    
#     scope :search_by_employee, ->(search_query) {
#     where("name ILIKE :query OR email ILIKE :query", query: "%#{search_query}%")
#   }
# #   after_create :set_time

    
#   private
#   def set_time
#     self.time = Time.parse(self.time)
#   end

end