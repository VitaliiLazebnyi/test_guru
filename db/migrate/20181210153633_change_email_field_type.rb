# frozen_string_literal: true

class ChangeEmailFieldType < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :email, :citext
  end
end
