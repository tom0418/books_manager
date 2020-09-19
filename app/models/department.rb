class Department < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :department_name, presence: true,
                              length: { maximum: 30 }
  validates :manager_name, presence: true,
                           length: { maximum: 60 }
  validates :description, length: { maximum: 255 }
end
