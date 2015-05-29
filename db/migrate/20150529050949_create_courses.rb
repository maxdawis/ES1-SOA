class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.integer :department_id

      t.timestamps null: false
    end
  end
end
