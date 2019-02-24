# frozen_string_literal: true

class Admin < User
  validates :firstname, presence: true
  validates :lastname, presence: true

  def admin?
    true
  end
end
