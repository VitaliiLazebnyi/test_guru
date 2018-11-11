class Question < ApplicationRecord
  belongs_to :test
  has_many   :answers

  validates_associated :answers
  validates :answers, length: { maximum: 4 }
  validates :test,    presence: true
  validates :body,    presence: true, length: { in: 3..256 }
end
