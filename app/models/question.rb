class Question < ApplicationRecord
  belongs_to :test
  has_many   :answers

  validate  :answers_number
  validates_associated :answers
  validates :test,    presence: true
  validates :body,    presence: true, length: { in: 3..256 }

  private

  def answers_number
    if answers.size > 4
      errors.add(:answers, "can't contain more then 4 answers")
    end
  end
end
