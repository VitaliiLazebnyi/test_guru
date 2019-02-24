# frozen_string_literal: true

class AddDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :level, 0)

    change_column_default(:answers, :correct, false)
  end
end
