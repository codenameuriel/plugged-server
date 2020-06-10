class Source < ApplicationRecord
  has_many :user_sources, dependent: :destroy
  has_many :users, through: :user_sources
end
