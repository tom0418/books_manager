class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, default: ""
      t.string :author, null: false, default: ""
      t.string :publisher, null: false, default: ""
      t.string :published_date, null: false, default: ""
      t.bigint :isbn_10
      t.bigint :isbn_13
      t.text :description
      t.integer :quantity, null: false, default: 1

      t.timestamps

      t.index :title, unique: true
      t.index :isbn_10, unique: true
      t.index :isbn_13, unique: true
    end
  end
end
