class AddDataToInstitutes < ActiveRecord::Migration
  #def change
  #end

  def self.up
    change_table :institutes do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :institutes, :picture
  end
end
