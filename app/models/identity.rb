# frozen_string_literal: true

class Identity < ApplicationRecord
  has_many :users
end
