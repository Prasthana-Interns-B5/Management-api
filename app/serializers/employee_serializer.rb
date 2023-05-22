class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :email, :role, :manager_id,:notification  ,:meeting_notifications
  
  # has_many :subordinates, if: :manager_id_exists

  # def manager_id_exists
  #   self.manager_id.nil?
  # end



  def  notification
  
    month=Date.new(Time.now.year,Time.now.month)
    feedback=object.feedbacks.where(created_at: month.beginning_of_month..month.end_of_month-8)
    if !feedback.exists?
      return "please fill the feedback and points"
    else
      return "Please attend the metting"

    end
  end

 
  


   def meeting_notifications
    month=Date.new(Time.now.year,Time.now.month)
    subordinate=object.subordinates
    subordinate.map do |s|
      feedback=s.feedbacks.where(meeting: false).where(created_at: month.beginning_of_month..month.end_of_month-8)
         feedback.map do |f|
           if !f.nil?
            "conduct a 1-1 meeting for #{s.id}"
           end
           end
        
    end
   end

end

