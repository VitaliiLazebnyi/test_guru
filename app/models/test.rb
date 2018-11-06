class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many   :marks
  has_many   :users, through: :marks

  def self.with_category(title)
    Test.select(:title)
        .joins('JOIN categories ON tests.category_id = categories.id')
        .where('categories.title': title)
        .order(title: :desc)
        .pluck(:title)
  end
end
