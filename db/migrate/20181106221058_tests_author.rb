# frozen_string_literal: true

class TestsAuthor < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author
  end
end
