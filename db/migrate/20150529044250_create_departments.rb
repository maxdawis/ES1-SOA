class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.integer :institute_id

      t.timestamps null: false
    end
  end
end
