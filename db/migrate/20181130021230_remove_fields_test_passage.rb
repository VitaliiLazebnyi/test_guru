class RemoveFieldsTestPassage < ActiveRecord::Migration[5.2]
  def change
    remove_column :test_passages, :result
    remove_column :test_passages, :questions_number
  end
end
