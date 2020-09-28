class CreateLendedHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :lended_histories do |t|
      t.datetime :deadline
      t.datetime :returned_at
      t.integer :lended_quantity, null: false, default: 1
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
