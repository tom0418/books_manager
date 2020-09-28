class LendedHistory < ApplicationRecord
  has_many :lended_details, dependent: :destroy

  validates :lended_quantity, presence: true,
                              numericality: { only_integer: true }
  validates :user_id, presence: true
end
