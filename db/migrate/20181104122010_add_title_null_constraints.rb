class AddTitleNullConstraints < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    #change_column_null(:tests, :category, false)

    change_column_null(:categories, :title, false)

    change_column_null(:questions, :body, false)
    #change_column_null(:questions, :test, false)

    change_column_null(:answers, :body, false)
    #change_column_null(:answers, :question, false)

    change_column_null(:users, :name, false)

    change_column_null(:marks, :value, false)
    #change_column_null(:marks, :user, false)
    #change_column_null(:marks, :test, false)
  end
end
