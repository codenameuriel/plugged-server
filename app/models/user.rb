class User < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :articles, through: :collections
  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
  has_many :user_sources, dependent: :destroy
  has_many :sources, through: :user_sources
  has_many :user_topics, dependent: :destroy
  has_many :topics, through: :user_topics
  has_many :newspapers, dependent: :destroy

  def get_newspapers
    newspapers = self.newspapers.map do |n|
      {
        title: n.title,
        sources: n.newspaper_sources.map do |ns|
          ns.source
        end,
        categories: n.newspaper_categories.map do |nc|
          nc.category
        end,
        topics: n.newspaper_topics.map do |nt|
          nt.topic
        end,
        created_at: n.created_at
      }
    end

    return newspapers
  end
end
