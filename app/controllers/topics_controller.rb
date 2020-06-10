class TopicsController < ApplicationController
  def build
    # byebug
    user = User.find_by(id: params["user"].to_i)
    params["categories"].each do |category|
      c = Category.find_by(name: category)
      UserCategory.find_or_create_by(user_id: user.id, category_id: c.id)
    end
    params["sources"].each do |source|
      s = Source.find_by(name: source)
      UserSource.find_or_create_by(user_id: user.id, source_id: s.id)
    end
    params["topics"].each do |topic|
      t = Topic.create(name: topic)
      UserTopic.find_or_create_by(user_id: user.id, topic_id: t.id)
    end
    render json: user, include: [:categories, :sources, :topics]
  end
end
