class User < ApplicationRecord
  has_many :marks
  has_many :passed_tests, through: :marks, source: :test
  has_many :owned_tests, class_name: :Test, foreign_key: :author_id

  def passed_with(level)
    Test.where(level: level, 'marks.user_id': id)
        .joins('JOIN marks ON marks.test_id = tests.id')
  end
end
