class EmployeeSignInSerializer < ActiveModel::Serializer
  attributes :auth_token,:expiration_time,:id,:email
  
end
