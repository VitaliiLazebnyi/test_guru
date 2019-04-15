# frozen_string_literal: true

class TestPassage < ApplicationRecord
  PASS_RATE = 0.85

  before_validation :set_next_question

  belongs_to :user
  belongs_to :test
  belongs_to :question, optional: true

  validates :user,   presence: true
  validates :test,   presence: true

  #
  # Should be used in controller and view
  #
  def accept!(answer_ids)
    self.correctly_answered += 1 if correct_answer?(answer_ids)

    save!
  end

  def finished?
    question.nil? || time_left <= 0
  end

  def passed?
    (correctly_answered.to_f / questions_count) >= PASS_RATE
  end

  def question_number
    test.questions.find_index(question) + 1
  end

  def questions_count
    test.questions.count
  end

  def time_left
    passed = Time.now - created_at
    test.duration - passed
  end

  private

  #
  # Before validation callbacks
  #
  def set_next_question
    if !test.duration.zero? && created_at && created_at + test.duration > Time.now
      return self.question = nil
    end

    q = if question
          test.questions.order(:id).where('id > ?', question.id).first
        else
          test.questions.first
    end

    self.question = q
  end

  # -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -

  #
  # other internal methods
  #
  def correct_answer?(answer_ids)
    # no answer is not allowed
    return false unless answer_ids

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    question.answers.correct
  end
end
