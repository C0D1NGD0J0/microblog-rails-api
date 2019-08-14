class ArticleSerializer
	include FastJsonapi::ObjectSerializer
  
  attributes :title, :content, :image_url
  belongs_to :user
end
