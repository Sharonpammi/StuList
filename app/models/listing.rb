class Listing < ActiveRecord::Base
	belongs_to :user
	
	has_attached_file :photo, :styles => { :small => "200x1200" }
	default_scope -> { order('created_at DESC') }	
	validates :name, presence: true, length: {maximum: 140}
	validates :producttype, presence: true
	validates :subcategory, presence: true
	validates :category, presence: true
	validates :price, presence: true
	validates :user_id, presence: true
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
end
