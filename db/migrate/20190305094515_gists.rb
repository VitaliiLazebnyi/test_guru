# frozen_string_literal: true

class Gists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.string :question
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
