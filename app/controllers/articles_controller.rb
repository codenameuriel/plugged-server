class ArticlesController < ApplicationController
  def index
    articles = Article.all
    if articles
      paginate json: articles
    else
      render json: { message: 'No articles found in database' }
    end
  end

  def create
    # byebug
    article = Article.create(article_params)
    if article 
      render json: article
    else
      render json: { message: 'Could not create article' }
    end
  end

  def destroy
    # byebug
    article = Article.find_by(id: params[:id])
    if article
      article.destroy
      render json: article
    else
      render json: { message: 'Could not find article to destroy' }
    end
  end

  private 

  def article_params
    params.require(:article).permit(:author, :content, :description, :published_at, :source, :title, :url, :url_to_image)
  end
end
