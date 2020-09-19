class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :department_name, null: false, default: ""
      t.string :manager_name, null: false, default: ""
      t.text :description, limit: 255

      t.timestamps
    end
  end
end
