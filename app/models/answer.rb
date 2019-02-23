# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true, length: { in: 3..256 }
  validate  :answer_is_less_then_fifth, on: :create

  private

  def answer_is_less_then_fifth
    if !question || question.answers.size >= 4
      errors.add(:question, :wrong_answers_quantity)
    end
  end
end
