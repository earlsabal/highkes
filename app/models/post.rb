class Post < ActiveRecord::Base
	belongs_to :user
	validates :image, presence: true

	has_attached_file :image, :storage => ENV['S3_BUCKET_NAME'] ? :s3 : :filesystem,:default_url => "/images/emptyuser.png"
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
