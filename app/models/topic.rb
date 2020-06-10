class Topic < ApplicationRecord
  has_many :user_topics, dependent: :destroy
  has_many :users, through: :user_topics
  has_many :newspaper_topics, dependent: :destroy
  has_many :newspapers, through: :newspaper_topics
end
