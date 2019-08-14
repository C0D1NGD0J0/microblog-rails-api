class ArticlesController < ApplicationController
	skip_before_action :authorize, only: [:index, :show]
	before_action :set_article, only: [:show, :update]

	include CurrentUserConcern
	include SerializeResource

	def index 
		articles = Article.recent_articles.page(params[:page]).per(params[:per_page])
		serialize_articles = parse_article_json.new(articles)
		render json: { status: 200, articles: serialize_articles }
	end

	def show
		render json: { status: 200, article: @article }
	end

	def create
		article = @current_user.articles.build(article_params)
		begin article.save!
			render json: { status: :created, article: article, msg: "Article successfully created." }
		rescue
			render json: { status: :unprocessable_entity }
		end
	end

	def update
		article = @current_user.articles.find(params[:id])
		begin 
			article.update_attributes!(article_params)
			render json: { status: :ok, article: parse_article_json(article) }
		rescue
			render json: { status: :unprocessable_entity, errors: {msg: "Oops!, something went wrong."} }
		end
	end

	def destroy
		article = @current_user.articles.find(params[:id])
		article.destroy
		render json: { status: 200, msg: "Article has been deleted." }
	end

	private
		def set_article
			@article = Article.find(params[:id])
		end

		def article_params
			params.require(:article).permit(:title, :content, :image_url)
		end
end