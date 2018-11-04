class Test < ApplicationRecord
  belongs_to :category
  has_many   :marks
end
