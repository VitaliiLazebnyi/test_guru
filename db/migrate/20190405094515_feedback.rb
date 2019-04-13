# frozen_string_literal: true

class Feedback < ActiveRecord::Migration[5.2]
  create_table 'feedbacks', force: :cascade do |t|
    t.text 'body', null: false
  end
end
