class FeedbackSerializer < ActiveModel::Serializer
  attributes :id ,:self_feedback,:employee_id,:month,:before,:manager_id,:manager_feedback,:comments
end
