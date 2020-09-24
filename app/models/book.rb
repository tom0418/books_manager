class Book < ApplicationRecord
  has_many :collections, dependent: :destroy

  validates :title, presence: true,
                    uniqueness: true
  validates :author, presence: true
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

  def substitute_for_googlebook(google_book)
    self.title = google_book.title
    self.author = google_book.author
    self.published_date = google_book.published_date
    self.isbn_10 = google_book.isbn10
    self.isbn_13 = google_book.isbn13
    self.description = google_book.description
    self
  end
end
