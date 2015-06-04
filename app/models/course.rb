class Course < ActiveRecord::Base
	belongs_to :department

	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100#" },
  :default_url => "/images/:style/imgdirectory.png"
  #validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  # Validations
  validates_attachment :picture,
  :size => { :in => 0..10.megabytes },
  :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end
