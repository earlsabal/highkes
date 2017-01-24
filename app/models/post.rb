class Post < ActiveRecord::Base
	validates :image, presence: true

	has_attached_file :image, :default_url => "/images/emptyuser.png"
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
