class User < ActiveRecord::Base
	has_many :posts
	has_many :likes, dependent: :destroy
	has_many :liked_posts, :through => :likes, :source => :post
	has_many :comments
	has_attached_file :image, :source_file_options => { :all => '-auto-orient' }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :email,
	  presence: true,
	  uniqueness: {case_sensitive: false}
	validates :username,
 	  :presence => true,
 	  :uniqueness => {:case_sensitive => false} 
   	validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true


	def like!(post)
	  self.likes.create!(post_id: post.id)
	end

	def unlike!(post)
	  like = self.likes.find_by_post_id(post.id)
	  like.destroy!
	end

	def like?(post)
	  self.likes.find_by_post_id(post.id)
	end

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	    :recoverable, :rememberable, :trackable, :validatable
end
