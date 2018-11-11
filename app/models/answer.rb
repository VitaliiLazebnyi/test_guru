class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :question_id, presence: true
  validates :body,        presence: true, length: { in: 3..256 }
  validates :correct,     inclusion: { in: [true, false] }

end
