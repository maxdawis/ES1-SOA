class AddDataToDepartments < ActiveRecord::Migration
  #def change
  #end

  # Upload images
  def self.up
    change_table :departments do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :departments, :picture
  end
end
