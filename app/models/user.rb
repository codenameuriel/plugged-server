class User < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :articles, through: :collections
end
