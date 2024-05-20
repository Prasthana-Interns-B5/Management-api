# frozen_string_literal: true

class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :employee_id, :employee_feedback, :feedback_type, :created_at, :flag
end
