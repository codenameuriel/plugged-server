class Newspaper < ApplicationRecord
  belongs_to :user
  has_many :newspaper_sources, dependent: :destroy
  has_many :sources, through: :newspaper_sources
  has_many :newspaper_topics, dependent: :destroy
  has_many :topics, through: :newspaper_topics
  has_many :newspaper_categories, dependent: :destroy
  has_many :categories, through: :newspaper_categories
end
