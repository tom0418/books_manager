class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :collection_code, null: false, default: ""
      t.boolean :status, default: true, null: false
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
