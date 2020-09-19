class AddDepartmentIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :department, foreign_key: true, after: :admin
  end
end
