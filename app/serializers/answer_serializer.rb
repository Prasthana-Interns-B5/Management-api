# frozen_string_literal: true

class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :reply, :question_id, :employee_id
end
