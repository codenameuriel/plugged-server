class CollectionsController < ApplicationController
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
