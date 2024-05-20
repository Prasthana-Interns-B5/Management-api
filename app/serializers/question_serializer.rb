# frozen_string_literal: true

class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :query, :clarified, :remarks, :manager_id
end
