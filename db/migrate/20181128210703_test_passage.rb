class TestPassage < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passages do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.references :question, foreign_key: true
      t.integer    :correctly_answered, default: 0
      t.integer    :questions_number, null: false
      t.integer    :result, default: 0
      t.timestamps
    end
  end
end
