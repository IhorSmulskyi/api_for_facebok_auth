# frozen_string_literal: true

class CreateIdentities < ActiveRecord::Migration[5.2]
  def change
    create_table :identities do |t|
      t.string :user_id
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
