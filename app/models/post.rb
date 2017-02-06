class Post < ActiveRecord::Base
	belongs_to :user
	has_many :hearts
	has_many :hearting_users, through: :hearts, source: :user
	has_many :comments
	validates :image, presence: true

	has_attached_file :image
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
