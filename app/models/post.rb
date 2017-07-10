class Post < ApplicationRecord
	has_many :comments
	belongs_to :list
	has_many :user
	has_attached_file :image, styles: { medium: "135x135>", thumb: "130x130>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  	def self.search(search)
     where("title LIKE ? or name LIKE ?", "%#{search}%", "%#{search}%") 
    end
end

  	

