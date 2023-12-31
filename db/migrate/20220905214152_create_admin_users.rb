# frozen_string_literal: true

class CreateAdminUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_users do |t|
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
