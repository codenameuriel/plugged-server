class SourcesController < ApplicationController
  def index
    sources = Source.all
    if sources
      render json: sources
    else
      render json: { message: 'Could not find sources'}
    end
  end

  def create
    # byebug
    params["source"].each do |source|
      Source.create(name: source["name"], url: source["url"], description: source["description"], country: source["country"], category: source["category"], language: source["language"])
    end

    # if source
    #   render json: source 
    # else
    #   render json: { message: 'Could not create news source'}
    # end
  end

  def source
    sources = Source.all.select do |source|
      source.category == (params[:category])
    end
    if sources 
      render json: sources
    else
      render json: { message: 'Could not find news sources' }
    end
  end

  private

  def source_params
    params.require(:source).permit(:name, :description, :category, :url, :country, :language)
  end
end
