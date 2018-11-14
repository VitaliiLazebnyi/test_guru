class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :test

  validates :value, presence: true,
            numericality: {
                only_integer:          true,
                greater_than:          0,
                less_than_or_equal_to: 5
            }

  validates :user, presence: true
  validates :test, presence: true
end
