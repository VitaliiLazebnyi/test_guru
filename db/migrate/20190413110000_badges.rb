# frozen_string_literal: true

class Badges < ActiveRecord::Migration[5.2]
  create_table 'badges', force: :cascade do |t|
    t.text :name, null: false
    t.text :url, null: false
    t.text :rule, null: false
    t.text :rule_value
  end

  create_table 'badges_users', force: :cascade do |t|
    t.integer :user_id, null: false
    t.integer :badge_id, null: false
  end
end
