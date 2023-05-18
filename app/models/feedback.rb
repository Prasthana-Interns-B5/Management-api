class Feedback < ApplicationRecord
  belongs_to :employee
  
  # def is_not_nil
  #    self.subordinate_id.present?
  # end

end
