class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :email, :role, :manager_id ,:notification

  
 def  notification
    if object.feedbacks.nil?
      return "please fill the feedback and points"
    else
      return "Successfully filled feedbacks and points  please attend the meeting"
    end
  end
 
# def  message
#   true if object.feedbacks.nil?
#         end
# end

 

end
