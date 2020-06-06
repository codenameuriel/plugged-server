class User < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :articles, through: :collections
  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
end
