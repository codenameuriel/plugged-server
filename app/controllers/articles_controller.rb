class ArticlesController < ApplicationController
  def create
    # byebug
    article = Article.create(article_params)
    if article 
      render json: article
    else
      render json: { message: 'Could not create article' }
    end
  end

  private 

  def article_params
    params.require(:article).permit(:author, :content, :description, :published_at, :source, :title, :url, :url_to_image)
  end
end
