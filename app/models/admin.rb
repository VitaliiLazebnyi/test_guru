class Admin < User
  validates :firstname, presence: true
  validates :lastname, presence: true
end
