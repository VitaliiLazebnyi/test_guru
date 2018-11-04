class CreateMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :marks do |t|
      t.integer :value
      t.references :user
      t.references :test

      t.timestamps
    end
  end
end
