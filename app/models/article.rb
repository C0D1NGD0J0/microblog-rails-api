class Article < ApplicationRecord
	validates :title, :content, :image_url, :slug, presence: true
	validates :title, :slug, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
	
	slug :title
	scope :recent_articles, -> { order(created_at: :desc) }
end
