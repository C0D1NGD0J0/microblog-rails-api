class Article < ApplicationRecord
	belongs_to :user
	enum status: [:draft, :pending, :approved]

	validates :title, :content, :image_url, :slug, presence: true
	validates :title, :slug, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
	
	scope :recent_articles, -> { order(created_at: :desc) }
end
