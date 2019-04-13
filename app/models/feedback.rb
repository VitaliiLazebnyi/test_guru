# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :body,
            presence: true,
            length: { in: 3..255 }
end
