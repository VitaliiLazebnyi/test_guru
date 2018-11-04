class User < ApplicationRecord
  has_many :marks

  def passed_with(level)
    marks = self.marks.select {|m| m.test.level == level }
    marks.map &:test
  end
end
