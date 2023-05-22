class FeedbackSerializer < ActiveModel::Serializer
  attributes :id ,:self_feedback,:employee_id,:month,:feedback_submitted ,:manager_id,:manager_feedback,:comments,:meeting
end
