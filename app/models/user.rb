class User < ApplicationRecord
  has_many :collections
  has_many :articles, through: :collections
end
