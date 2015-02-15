class Recipe < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
     validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
     validates :image, :veggie1, :veggie2, :fruit1, :fruit2, presence: true
end
