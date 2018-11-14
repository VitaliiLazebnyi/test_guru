class User < ApplicationRecord
  has_many :marks
  has_many :passed_tests, through: :marks, source: :test
  has_many :owned_tests, class_name: :Test, foreign_key: :author_id

  validates_associated :marks
  validates_associated :passed_tests
  validates_associated :owned_tests
  validates :name,
            presence: true,
            length: { in: 3..256 }

  validates :email,
            presence:   true,
            uniqueness: true,
            format: {
                with: /\A[^@\s]+@[^@.\s]+\.+[^@.\s]+\z/
            }

  def tests_with_level(level)
    passed_tests.where(level: level)
  end
end
