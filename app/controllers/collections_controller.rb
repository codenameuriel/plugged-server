class CollectionsController < ApplicationController
  def show
    # byebug
    collection = Collection.all.find_all { |c| c.user_id == params[:id].to_i }
  
    if collection
      result = collection.map do |c| 
        { article: c.article }
      end

      render json: result
    else
      render json: { message: 'Could not find collection' }
    end
  end

  def create
    # byebug
    collection = Collection.find_or_create_by(collection_params)
    if collection
      render json: collection
    else
      render json: { message: 'Could not create collection' }
    end
  end

  private 

  def collection_params
    params.require(:collection).permit(:user_id, :article_id)
  end
end
