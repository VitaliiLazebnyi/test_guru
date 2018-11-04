class Test < ApplicationRecord
  belongs_to :category
  has_many   :marks

  def with_category(title)
    Test.all.where(
        category: Category.where(title: title)
    )
  end
end
