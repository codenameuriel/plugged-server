class User < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :articles, through: :collections
  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
  has_many :user_sources, dependent: :destroy
  has_many :sources, through: :user_sources
  has_many :user_topics, dependent: :destroy
  has_many :topics, through: :user_topics
  has_many :newspapers
end
