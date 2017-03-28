class Post < ActiveRecord::Base
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :liking_users, through: :likes, source: :user
	has_many :comments
	validates :image, presence: true
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
