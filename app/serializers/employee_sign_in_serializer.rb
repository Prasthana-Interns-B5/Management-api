class EmployeeSignInSerializer < ActiveModel::Serializer
  attributes :auth_token,:token_type,:expiration_time,:name,:role,:id,:email

  def token_type
    "Bearer"
  end
end
