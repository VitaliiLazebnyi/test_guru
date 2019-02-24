# frozen_string_literal: true

class UserColumnsUniq < ActiveRecord::Migration[5.2]
  def change
    add_column    :users, :email, :string
    change_column :users, :email, :string, null: false
    add_index     :users, :email, unique: true
  end
end
