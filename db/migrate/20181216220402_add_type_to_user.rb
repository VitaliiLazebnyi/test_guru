# frozen_string_literal: true

class AddTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string, default: 'User', null: false
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string

    add_index :users, :type
  end
end
