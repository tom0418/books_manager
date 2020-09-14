class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string, null: false, default: "", after: :encrypted_password
    add_column :users, :last_name, :string, null: false, default: "", after: :first_name
    add_column :users, :admin, :boolean, default: false, null: false, after: :last_name
    add_column :users, :department_id, :integer, default: 1, null: false, after: :admin
  end
end
