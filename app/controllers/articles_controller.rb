class ArticlesController < ApplicationController
	skip_before_action :authorize, only: [:index, :show]

	def index 
		articles = Article.recent_articles.page(params[:page]).per(params[:per_page])
		render json: { status: 200, articles: articles }
	end

	def show
		article = Article.find(params[:id])
		render json: { status: 200, article: article }
	end

	def create
		article = Article.new(article_params)
	end

	private
		def article_params
			params.require(:article).permit(:title, :content, :image_url)
		end
end