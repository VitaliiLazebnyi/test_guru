class ColumnsUniq < ActiveRecord::Migration[5.2]
  def change
    add_index :categories, :title, unique: true
    add_index :tests,     [:title, :level], unique: true

    add_column    :users, :email, :string
    change_column :users, :email, :string, null: false
    add_index     :users, :email, unique: true
  end
end
