# frozen_string_literal: true

class RegistrationIdentityTable
  def self.create_identity_user(user, user_data, get_provider = 'facebook')
    identity_user = Identity.new(uid: user_data['id'],
                                 provider: get_provider,
                                 user_id: user['id'])
  end
end
