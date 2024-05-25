class UserLoginSerializer < ActiveModel::Serializer
  attributes :id, :login_token, :email
end
