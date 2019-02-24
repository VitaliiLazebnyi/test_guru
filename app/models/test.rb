# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many   :questions
  has_many   :test_passages
  has_many   :users, through: :test_passages, source: :user

  validates_associated :users
  validates_associated :questions

  validates :title, uniqueness: { scope: :level }
  validates :title,
            presence: true,
            length: { in: 3..256 }

  validates :level, presence: true,
                    numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 0
                    }

  validates :category, presence: true
  validates :author,   presence: true

  scope :easy,  -> { where(level: 0..1) }
  scope :midle, -> { where(level: 2..4) }
  scope :high,  -> { where(level: 5..Float::INFINITY) }

  scope :with_category_titles, lambda { |title|
    joins(:category)
      .where(categories: { title: title })
  }
end
