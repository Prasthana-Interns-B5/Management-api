class EmployeeSerializer < ActiveModel::Serializer

  attributes :id, :employee_no, :name, :email, :role, :manager_name, :manager_id




  # def  notification
  #   if !object.feedbacks.exists? && Date.today.day >= 20
  #     return "please fill the feedback and points"
  #   else
  #     return "Successfully filled feedbacks and points  please attend the meeting"
  #   end
  # end



   def  notification
  
    month=Date.new(Time.now.year,Time.now.month)
    feedback=object.feedbacks.where(created_at: month.beginning_of_month..month.end_of_month-10)
    if !feedback.exists?
      return "please fill the feedback and points"
    else
      return "Please attend the metting"

    end

   end

end
