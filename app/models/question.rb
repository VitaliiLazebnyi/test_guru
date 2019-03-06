# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many   :answers
  has_many   :gists

  validates_associated :answers
  validates :test,    presence: true
  validates :body,    presence: true, length: { in: 3..256 }
end
