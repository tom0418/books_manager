class LendedDetail < ApplicationRecord
  belongs_to :lended_history
  belongs_to :collection

  validates :lended_history_id, presence: true
  validates :collection_id, presence: true
end
