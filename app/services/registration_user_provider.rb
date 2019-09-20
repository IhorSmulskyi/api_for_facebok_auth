# frozen_string_literal: true

class RegistrationUserProvider
  def create_user(user_data, get_provider)
    User.new(email: user_data['email'],
             uid: user_data['id'],
             provider: get_provider,
             image: user_data['picture']['data']['url'],
             password: Devise.friendly_token[0, 20])

    user.authentication_token = User.generate_unique_secure_token
  end
end
