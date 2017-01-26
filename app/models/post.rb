class Post < ActiveRecord::Base
	belongs_to :user
	validates :image, presence: true

	has_attached_file :image, :storage => ENV['AWS_S3_BUCKET'] ? :s3 : :filesystem,:default_url => "/images/emptyuser.png"
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
