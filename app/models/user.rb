class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  EMAIL_REGEXP = /\A[\w.-]+@[\w.-]+\.[\w.-]+\z/.freeze

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
