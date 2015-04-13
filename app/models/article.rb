class Article < ActiveRecord::Base
	# "dependent: :destroy" is there to ensure that all dependent, associated items are deleted along with the specific article
	# ex. When article is deleted, it's comments will be deleted alog with it.   
  has_many :comments, dependent: :destroy	
  validates :title, presence: true,
                    length: { minimum: 5 }
end
