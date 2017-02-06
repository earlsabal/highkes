class User < ActiveRecord::Base
  has_many :posts
  has_many :hearts, dependent: :destroy
  has_many :hearted_posts, :through => :hearts, :source => :post
  has_many :comments
  attr_accessor :login
  has_attached_file :image, :source_file_options => { :all => '-auto-orient' }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :username,
	  :presence => true,
	  :uniqueness => {
	  	:case_sensitive => false
  	  } 
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  validate :validate_username

	def validate_username
	  if User.where(email: username).exists?
	    errors.add(:username, :invalid)
	  end
	end

	def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    if conditions[:username].nil?
	      where(conditions).first
	    else
	      where(username: conditions[:username]).first
	    end
	  end
	end

	def heart!(post)
	  self.hearts.create!(post_id: post.id)
	end

	# destroys a heart with matching post_id and user_id
	def unheart!(post)
	  heart = self.hearts.find_by_post_id(post.id)
	  heart.destroy!
	end

	# returns true of false if a post is hearted by user
	def heart?(post)
	  self.hearts.find_by_post_id(post.id)
	end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
