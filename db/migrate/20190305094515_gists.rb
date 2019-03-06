# frozen_string_literal: true

class Gists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.integer :question_id
      t.integer :user_id
      t.string :url

      t.timestamps
    end
  end
end
