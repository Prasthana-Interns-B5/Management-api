module CustomTokenResponse
  def body
    user = User.find(@token.resource_owner_id)
    custom_token_response = {
      user: user
    }
    super.merge(custom_token_response)
  end
end
