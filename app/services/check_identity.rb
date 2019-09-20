class CheckIdentity
  
  def facebook(data)
    provider_data = JSON.parse(data)
    # user = User.find_by email: user_data['email']
    user_identity = Identity.find_by uid: user_data['id']

    case user_identity
    when user_identity?
      User.find_by uid: user_data['id'].generate_new_authentication_token
      json_response 'User Information', true, { user: (User.find_by uid: user_data['id']) }, :ok
    else
      check_user_email(user_data)
    end
  end

  def check_user_email(user_data)
    if (user = User.find_by email: user_data['email'])
      ::RegistrationIdentityTable.create_identity_user(user, user_data, @provider)
      authentication_token = User.generate_unique_secure_token
      json_response "Login #{@provider} Successfully", true, { user: user }, :ok
    else
      user = ::RegistrationUserProvider.new(user_data, @provider)
      authentication_token = User.generate_unique_secure_token
      json_response "Login #{@provider} Successfully", true, { user: user }, :ok
    end
  end

end
