class User < ApplicationRecord
  has_many :marks

  def passed_with(level)
    Test.where(level: level, 'marks.user_id': self)
        .joins('JOIN marks ON marks.test_id = tests.id')
  end
end
