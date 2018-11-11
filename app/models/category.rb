class Category < ApplicationRecord
  has_many :tests

  scope :by_title, ->{ order(title: :asc)}

  validates_associated :tests
  validates :title,
            presence: true,
            length: { in: 3..32 },
            uniqueness: true
end
