class Category < ApplicationRecord
  has_many :tests

  scope :by_title, ->{ order(title: :asc)}
end
