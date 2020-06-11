class NewspapersController < ApplicationController
  def build
    # byebug

    user = User.find_by(id: params["user"].to_i)
    newspaper = Newspaper.create(title: params["title"], user_id: user.id)
    params["categories"].each do |category|
      c = Category.find_by(name: category)
      UserCategory.find_or_create_by(user_id: user.id, category_id: c.id)
      NewspaperCategory.find_or_create_by(newspaper_id: newspaper.id, category_id: c.id)
    end
    params["sources"].each do |source|
      s = Source.find_by(name: source)
      UserSource.find_or_create_by(user_id: user.id, source_id: s.id)
      NewspaperSource.find_or_create_by(newspaper_id: newspaper.id, source_id: s.id)
    end
    params["topics"].each do |topic|
      t = Topic.create(name: topic)
      UserTopic.find_or_create_by(user_id: user.id, topic_id: t.id)
      NewspaperTopic.find_or_create_by(newspaper_id: newspaper.id, topic_id: t.id)
    end
    # render json: user, include: [:categories, :sources, :topics, :newspapers]
    render json: {
      title: newspaper.title, 
      sources: newspaper.sources,
      categories: newspaper.categories,
      topics: newspaper.topics,
      created_at: newspaper.created_at
      # username: user.username,
    }
  end
end
