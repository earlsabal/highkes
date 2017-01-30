class Post < ActiveRecord::Base
	belongs_to :user
	validates :image, presence: true

	has_attached_file :image, :url =>':s3_domain_url'
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
