# frozen_string_literal: true

class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :employee_no, :name, :email, :role, :reporting_manager_id

  def notification
    month = Date.new(Time.now.year, Time.now.month)
    feedback = object.feedbacks.where(created_at: month.beginning_of_month..month.end_of_month - 10)
    if !feedback.select(:self_feedback).exists? && !feedback.select(:self_feedback).nil?
      'please fill the feedback'
    elsif !feedback.select(:manager_feedback).nil?
      'Manager has to fill the feedback'
    else
      'You are ready to attend the metting'
    end
  end

  def meeting_notifications
    month = Date.new(Time.now.year, Time.now.month)
    subordinate = object.subordinates
    subordinate.map do |s|
      feedback = s.feedbacks.where(meeting: false).where(created_at: month.beginning_of_month..month.end_of_month - 8)
      feedback.map do |f|
        "conduct a 1-1 meeting for #{s.id}" unless f.nil?
      end
    end
  end
end
