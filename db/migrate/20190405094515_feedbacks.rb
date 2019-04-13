# frozen_string_literal: true

class Feedbacks < ActiveRecord::Migration[5.2]
  create_table 'feedbacks', force: :cascade do |t|
    t.text :body, null: false
    t.integer :user_id, null: false
  end
end
