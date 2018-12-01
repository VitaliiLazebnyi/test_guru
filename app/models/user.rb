require 'digest/sha1'

class User < ApplicationRecord
  const EMAIL_REGEXPЗ = /\A[\w.-]+@[\w.-]+\.[\w.-]+\z/

  has_secure_password

  has_many :test_passages
  validates_associated :test_passages

  has_many :tests, through: :test_passages, source: :test
  validates_associated :tests

  has_many :tests_owned, class_name: :Test, foreign_key: :author_id
  validates_associated :tests_owned

  validates :name,
            presence: true,
            length: { in: 3..256 }

  validates :email, presence: true,
            length: { in: 3..256 },
            uniqueness: { case_sensitive: false },
            format: { with: EMAIL_REGEXP }

  def tests_with_level(level)
    tests_passed.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
