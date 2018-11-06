class Test < ApplicationRecord
  belongs_to :category
  has_many   :marks

  def self.with_category(title)
    Test.select(:title)
        .joins('JOIN categories ON tests.category_id = categories.id')
        .where('categories.title': title)
        .order(title: :desc)
        .pluck(:title)
  end
end
