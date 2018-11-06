class User < ApplicationRecord
  has_many :marks
  has_many :tests, through: :marks

  def passed_with(level)
    Test.where(level: level, 'marks.user_id': id)
        .joins('JOIN marks ON marks.test_id = tests.id')
  end
end
