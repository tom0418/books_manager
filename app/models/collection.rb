class Collection < ApplicationRecord
  belongs_to :book

  validates :collection_code, presence: true
end
