class CreateLendedDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :lended_details do |t|
      t.references :lended_history, type: :bigint, foreign_key: true
      t.references :collection, foreign_key: true
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
