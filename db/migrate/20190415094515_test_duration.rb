# frozen_string_literal: true

class TestDuration < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :duration, :integer, default: 0
  end
end
