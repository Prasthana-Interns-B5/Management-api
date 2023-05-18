class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :query, :employee_id, :clarified, :remarks
end
