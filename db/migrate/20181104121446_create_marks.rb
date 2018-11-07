class CreateMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :marks do |t|
      t.integer :value, null: false
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false

      t.timestamps
    end
  end
end
