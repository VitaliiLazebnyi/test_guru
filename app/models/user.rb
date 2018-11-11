class User < ApplicationRecord
  has_many :marks
  has_many :passed_tests, through: :marks, source: :test
  has_many :owned_tests, class_name: :Test, foreign_key: :author_id

  def tests_with_level(level)
    Test.with_level_for_user(level, self)
  end
end
