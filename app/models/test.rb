class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many   :questions
  has_many   :marks
  has_many   :users, through: :marks

  scope :easy,  -> { where(level: 0..1).order(created_at: :desc)}
  scope :midle, -> { where(level: 2..4).order(created_at: :desc)}
  scope :high,  -> { where(level: 5..Float::INFINITY).order(created_at: :desc)}

  scope :titles_with_category, -> (title) do
    select(:title)
        .joins('JOIN categories ON tests.category_id = categories.id')
        .where('categories.title': title)
        .order(title: :desc)
        .pluck(:title)
  end

  scope :with_level_for_user, -> (level, user) do
    where(level: level, 'marks.user_id': user.id)
        .joins('JOIN marks ON marks.test_id = tests.id')
  end

  validates_associated :questions
  validates_associated :marks
  validates_associated :users

  validates :title,
            presence: true,
            length: { in: 3..256 }

  validates :level, presence: true,
            numericality: {
                only_integer:          true,
                greater_than_or_equal_to: 0
            }

  validates :category, presence: true
  validates :author,   presence: true
end
