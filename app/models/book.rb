class Book < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :published_date, presence: true,
                             length: { maximum: 10 }
  validates :isbn_10, numericality: { only_integer: true },
                      allow_blank: true,
                      length: { maximum: 10 },
                      uniqueness: true
  validates :isbn_13, numericality: { only_integer: true },
                      allow_blank: true,
                      length: { maximum: 13 },
                      uniqueness: true
  validates :quantity, presence: true,
                       numericality: { only_integer: true }
end
